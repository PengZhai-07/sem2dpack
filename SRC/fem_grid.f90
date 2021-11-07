module fem_grid

!=======================================================================
!
!                       This module deals with quadrangle elements
!                       defined by 4 or 9 control nodes.
!                       The control nodes are defined as follows:
!
!                                       edge 3
!
!                               4 . . . . 7 . . . . 3
!                               .                   .
!                               .         t         .
!                               .                   .
!                   edge 4      8         9  s      6     edge 2
!                               .                   .
!                               .                   .
!                               .                   .
!                               1 . . . . 5 . . . . 2
!
!                                       edge 1
!
!                           Local coordinate system : s,t
!
!=======================================================================

  use elem_q4
  use elem_q8h
  use elem_q9
  use bnd_grid
  use constants
! use openmp library, but code still works if there's no openmp
!$ use OMP_LIB
  implicit none
  private

  type VertexConn_type
    integer, pointer :: elem(:)=>null(), node(:)=>null()
  end type VertexConn_type

  ! FEM coloring data
  type color
      integer :: nelem = 0
      integer, pointer :: elem(:) => null()
  end type color
  
  integer, parameter :: max_neighbor = 50

!---- Finite element mesh (Q4, Q8h or Q9)
!     npoin = total number of control nodes
!     ngnod = number of control nodes per element (4 or 9)
!     nelem = total number of elements
!     coord = coordinates of the control nodes
!     knods = local to global numbering for the control nodes
!             (ignod,element) -> control node index
!     tag   = element tags
!     ref   = node tags
!     bnds  = list of domain boundaries
!     flat  = flag for cartesian grid (allows simplifications)
!
! vertex connectivity data: (in Q8h and Q9 also includes internal nodes)
!     VertexConn(k)%elem(:) = elements sharing node k
!     VertexConn(k)%node(:) = local index of node k in each element
!
! edge connectivity data :
!     EdgeConn_elem(n,e) = element that shares edge#n of element#e
!     EdgeConn_edge(n,e) = edge# on matching element
!
! color data (used in OPENMP parallelization):
! colors(k)%nelem   = number of fem elements in color k 
! colors(k)%elem(:) = element indices in color k
!
! colorsA(ielem)    = color index for each element ielem
!

  type fem_grid_type
    integer :: npoin=0, ngnod=0, nelem=0
    double precision, pointer :: coord(:,:) =>null()
    integer, pointer :: knods(:,:) =>null(), &
                        tag(:)     =>null(), &
                        ref(:)     =>null(), &
                        colorsA(:) =>null()
    type(color), pointer :: colors(:)=>null()
    type(bnd_grid_type), pointer :: bnds(:) =>null()
    logical :: flat = .false.
    integer, dimension(:,:), pointer :: EdgeConn_elem =>null(), &
                                        EdgeConn_edge =>null()
    type(VertexConn_type), pointer :: VertexConn(:) =>null()
  end type fem_grid_type

  !-- element edges tags Up, Down, Left, Right
  integer, parameter :: edge_D = 1
  integer, parameter :: edge_R = 2
  integer, parameter :: edge_U = 3
  integer, parameter :: edge_L = 4

  !-- control nodes defining the element edges
  integer, dimension(4), parameter :: EdgeKnod1 = (/  1, 2, 3, 4 /) &
                                     ,EdgeKnod2   = (/  2, 3, 4, 1 /)

  !-- domain side tags Up, Down, Left, Right
  integer, parameter :: side_D = 1
  integer, parameter :: side_R = 2
  integer, parameter :: side_U = 3
  integer, parameter :: side_L = 4

  public :: fem_grid_type, VertexConn_type &
          , FE_GetShape, FE_GetDerShape, FE_GetElementCoord &
          , FE_GetEdgeNodesTab, FE_GetNodesPerElement, FE_GetNbElements &
          , FE_GetNbBoundaries, FE_GetNbNodes, FE_InquireBoundary &
          , FE_SetConnectivity, FE_UnsetConnectivity, FE_GetEdgeConn, FE_GetVertexConn &
          , FE_find_point, FE_GetElementSizes, FE_reorder &
          , edge_D,edge_R,edge_U,edge_L &
          , side_D,side_R,side_U,side_L, FE_GreedyColoring

contains

!=======================================================================
!

subroutine FE_SetConnectivity(grid)

  use generic_list, only : Link_Ptr_Type,Link_Type,List_Type &
     ,LI_Init_List,LI_Add_To_Head,LI_Get_Head &
     ,LI_Get_Next,LI_Associated,LI_Remove_Head,LI_Get_Len

  type(fem_grid_type), intent(inout) :: grid

  type Vertex_Data_Type
    integer :: elem=0,node=0
  end type Vertex_Data_Type

  type Vertex_Type
    type(Link_Type) :: Link
    type(Vertex_Data_Type) :: Data
  end type Vertex_Type

  type Vertex_Ptr_Type
    type(Vertex_Type), pointer :: P
  end type Vertex_Ptr_Type

  type(List_Type)     :: Vertex_List(grid%npoin)
  type(Link_Ptr_Type) :: Link
  type(Vertex_Ptr_Type) :: Vertex

  integer :: k,e,n,ee,nn,k1,k2,n1,n2

 ! Vertex data:
 ! For each node create a list of elements they belong to
 ! and store their node index local to that element
  do k = 1,grid%npoin
    call LI_Init_List(Vertex_List(k))
  enddo
  do e = 1,grid%nelem
  do n = 1,grid%ngnod
    allocate( Vertex%P ) ! reallocation
    Vertex%P%Data%elem = e
    Vertex%P%Data%node = n
    Link = transfer(Vertex,Link)
    call LI_Add_To_Head(Link,Vertex_List(grid%knods(n,e)))
  enddo
  enddo


  ! convert the vertex linked list into arrays, for easier handling
  allocate(grid%VertexConn(grid%npoin))
  do k = 1,grid%npoin
    n = LI_Get_Len(Vertex_List(k))
!    if (n==0) cycle  ! center point in Q9 element
    allocate(grid%VertexConn(k)%elem(n))
    allocate(grid%VertexConn(k)%node(n))
    n=0
    Link = LI_Remove_Head( Vertex_List(k) )
    do while ( LI_Associated(Link) )
      n = n+1
      Vertex = transfer(Link,Vertex)
      grid%VertexConn(k)%elem(n) = Vertex%P%Data%elem
      grid%VertexConn(k)%node(n) = Vertex%P%Data%node
      deallocate( Vertex%P )
      Link = LI_Remove_Head( Vertex_List(k) )
    enddo
  enddo

 ! edge data :
  allocate(grid%EdgeConn_elem(4,grid%nelem)) 
  allocate(grid%EdgeConn_edge(4,grid%nelem)) 
  grid%EdgeConn_elem = 0
  grid%EdgeConn_edge = 0
  do e = 1,grid%nelem
  do n = 1,4
    if ( grid%EdgeConn_elem(n,e)>0 ) cycle ! skip if already processed
    k1 = grid%knods(EdgeKnod1(n),e) 
    k2 = grid%knods(EdgeKnod2(n),e) 
   ! search another element (ee) shared by the two vertices of the current edge 
   ! ( Vertex_List(k1) and Vertex_List(k2) )
    nn = 0
    do n1=1,size(grid%VertexConn(k1)%elem)
      ! the fist vertex also belongs to element ee
      ee = grid%VertexConn(k1)%elem(n1)
      if (ee == e) cycle
      ! check if the second vertex also belongs to element ee
      ! if so: we found the matching edge
      do n2=1,size(grid%VertexConn(k2)%elem) 
        if (grid%VertexConn(k2)%elem(n2)==ee) then
         ! nn = edge# = first_control_node# 
         ! + because of the counterclockwise node numbering convention
         ! the second node of the current edge  
         ! is matched by the first node of the opposite edge:
          nn = grid%VertexConn(k2)%node(n2)
          grid%EdgeConn_elem(n,e) = ee
          grid%EdgeConn_edge(n,e) = nn
          grid%EdgeConn_elem(nn,ee) = e
          grid%EdgeConn_edge(nn,ee) = n
          exit
        endif
      enddo
      if (nn>0) exit
    enddo
  enddo
  enddo
   
end subroutine FE_SetConnectivity

!-----------------------------------------------------------------------
subroutine FE_UnsetConnectivity(grid)

  type(fem_grid_type), intent(inout) :: grid
  integer :: k

  deallocate(grid%EdgeConn_elem)
  deallocate(grid%EdgeConn_edge)
  do k=1,grid%npoin
    deallocate(grid%VertexConn(k)%elem)
    deallocate(grid%VertexConn(k)%node)
  enddo
  deallocate(grid%VertexConn)

end subroutine FE_UnsetConnectivity

!-----------------------------------------------------------------------
subroutine FE_GetEdgeConn(grid,e,n,ee,nn)

  type(fem_grid_type), intent(inout) :: grid
  integer, intent(in) :: e,n
  integer, intent(out) :: ee,nn

  if (.not.associated(grid%EdgeConn_elem)) call FE_SetConnectivity(grid)
  ee=grid%EdgeConn_elem(n,e)
  nn=grid%EdgeConn_edge(n,e)

end subroutine FE_GetEdgeConn

!-----------------------------------------------------------------------
subroutine FE_GetVertexConn(fem,e,n,ee,nn)

  type(fem_grid_type), intent(inout) :: fem
  integer, intent(in) :: e,n
  integer, pointer :: ee(:),nn(:)

  integer :: k

  if (.not.associated(fem%VertexConn)) call FE_SetConnectivity(fem)
  k = fem%knods(n,e)
  ee => fem%VertexConn(k)%elem
  nn => fem%VertexConn(k)%node

end subroutine FE_GetVertexConn

!=======================================================================
! Get a table of the extreme nodes (node1,node2) 
! for each of the four edges of an element
! in counterclockwise order
!
  function FE_GetEdgeNodesTab(grid,e)

  integer :: FE_GetEdgeNodesTab(2,4)
  type(fem_grid_type), intent(in) :: grid
  integer :: e

  FE_GetEdgeNodesTab(1,:) = grid%knods(EdgeKnod1,e)
  FE_GetEdgeNodesTab(2,:) = grid%knods(EdgeKnod2,e)

  end function FE_GetEdgeNodesTab

!=======================================================================
!
! example:
!
!  double precision pointer :: ptr(:,:)
!  ptr => FE_GetElementCoord(grid,e)
!  ...
!  deallocate(ptr)
!
  function FE_GetElementCoord(grid,e) result(coorg)

  type(fem_grid_type), intent(in) :: grid
  integer, intent(in) :: e
  double precision, pointer :: coorg(:,:)

  allocate(coorg(NDIME,grid%ngnod))
  coorg = grid%coord(:,grid%knods(:,e))

  end function FE_GetElementCoord


!=======================================================================
!
  function FE_GetNodesPerElement(grid) result(ngnod)
  type(fem_grid_type), intent(in) :: grid
  integer :: ngnod
  ngnod = grid%ngnod
  end function FE_GetNodesPerElement

!=======================================================================
!
  integer function FE_GetNbElements(grid)
  type(fem_grid_type), intent(in) :: grid
  FE_GetNbElements = grid%nelem
  end function FE_GetNbElements

!=======================================================================
!
  integer function FE_GetNbNodes(grid)
  type(fem_grid_type), intent(in) :: grid
  FE_GetNbNodes = grid%npoin
  end function FE_GetNbNodes


!=======================================================================
!
! GET SHAPE FUNCTIONS
! s,t = local coordinates [-1:1]*[-1:1]
!
  function FE_GetShape(xi,eta,ngnod) result(shape)

  double precision, intent(in) :: xi,eta
  integer, intent(in) :: ngnod
  double precision :: shape(ngnod)

  if ( ngnod == 4 ) then
    shape = Q4_GetShape(xi,eta)
  elseif (ngnod == 8) then
    shape = Q8h_GetShape(xi,eta)
  elseif (ngnod == 9) then
    shape = Q9_GetShape(xi,eta)
  endif  
  
  end function FE_GetShape
  

!=======================================================================
!
! dshape(i,j) = derivatives of shape function #i (associated to node #i)
!               with respect to coordinate #j
!
  function FE_GetDerShape(xi,eta,ngnod) result(dshape)

  double precision, intent(in) :: xi,eta
  integer, intent(in) :: ngnod
  double precision :: dshape(ngnod,2)

  if ( ngnod == 4 ) then
    dshape = Q4_GetDerShape(xi,eta)
  elseif (ngnod == 8) then
    dshape = Q8h_GetDerShape(xi,eta)
  elseif (ngnod == 9) then
    dshape = Q9_GetDerShape(xi,eta)
  endif  

  end function FE_GetDerShape


!=======================================================================
!
  function FE_GetNbBoundaries(grid) result(nb)

  type(fem_grid_type), intent(in) :: grid
  integer :: nb

  if (associated(grid%bnds)) then
    nb = size(grid%bnds)
  else
    nb = 0           
  endif

  end function FE_GetNbBoundaries

!=======================================================================
!
  subroutine FE_InquireBoundary(grid,i,nelem,tag,elems,edges)

  type(fem_grid_type), intent(in) :: grid
  integer, intent(in) :: i
  integer, intent(out), optional :: nelem,tag
  integer, pointer, optional :: elems(:), edges(:)

  type(bnd_grid_type), pointer :: b

  b => grid%bnds(i)
  if (present(nelem)) nelem = b%nelem
  if (present(tag))   tag   = b%tag
  if (present(elems)) elems => b%elem
  if (present(edges)) edges => b%edge
  
  end subroutine FE_InquireBoundary

!=====================================================================
!
  subroutine FE_GetElementSizes(dmax,dmin,e,grid)

    type (fem_grid_type), intent(in) :: grid
    double precision, intent(out) :: dmax,dmin 
    integer, intent(in) :: e

    double precision, pointer :: coorg(:,:)
    double precision :: x0,z0,x1,z1,x2,z2,x3,z3,hsq(4)

    coorg => FE_GetElementCoord(grid,e)
    x0 = coorg(1,1)
    z0 = coorg(2,1)
    x1 = coorg(1,2)
    z1 = coorg(2,2)
    x2 = coorg(1,3)
    z2 = coorg(2,3)
    x3 = coorg(1,4)
    z3 = coorg(2,4)
    deallocate(coorg)

    hsq(1) = (x1-x0)**2 + (z1-z0)**2 
    hsq(2) = (x2-x1)**2 + (z2-z1)**2 
    hsq(3) = (x3-x2)**2 + (z3-z2)**2 
    hsq(4) = (x3-x0)**2 + (z3-z0)**2

    dmax = sqrt( maxval(hsq) )
    dmin = sqrt( minval(hsq) )

  end subroutine FE_GetElementSizes

!=====================================================================
!
  function FE_GetElementArea(grid,e) result(area)

  type(fem_grid_type), intent(in) :: grid
  integer, intent(in) :: e

  double precision :: area,x1,x2,y1,y2
  double precision, pointer :: coorg(:,:)

  coorg => FE_GetElementCoord(grid,e)
  x1 = coorg(1,1)-coorg(1,3);
  x2 = coorg(2,1)-coorg(2,3);
  y1 = coorg(1,2)-coorg(1,4);
  y2 = coorg(2,2)-coorg(2,4);
  area = 0.5*abs( x1*y2 - x2*y1 )
  deallocate(coorg)

  end function FE_GetElementArea
  
!=====================================================================
!
  subroutine FE_find_point(coord,grid,e,xi,eta,new_coord,istatus)

  use utils, only : invert2
  use stdio, only : IO_abort

  double precision, intent(in)  :: coord(NDIME)
  type(fem_grid_type), intent(in) :: grid
  integer, intent(in) :: e
  double precision, intent(inout) :: xi,eta
  double precision, intent(out) :: new_coord(NDIME)
  integer, intent(out) :: istatus

  integer, parameter :: ntrial=100

  double precision :: esize,tolf,tolx, x(NDIME),p(NDIME), &
                      fvec(NDIME),fjac(NDIME,NDIME)
  double precision , pointer :: coorg(:,:)
  double precision :: shap(grid%ngnod), dshap(grid%ngnod,NDIME)
  integer :: n

  coorg => FE_GetElementCoord(grid,e)
  esize = sqrt( FE_GetElementArea(grid,e)/PI )

  x(1) = xi
  x(2) = eta
  tolx=TINY_XABS
  tolf=TINY_XABS*esize
  p=0d0

  do n=1,ntrial

    shap = FE_getshape(x(1),x(2),grid%ngnod)
    fvec = matmul(coorg, shap) - coord

    dshap = FE_getdershape(x(1),x(2),grid%ngnod)
    fjac = matmul(coorg, dshap)

    if (sum(abs(fvec)) <= tolf) exit
    p=-fvec
    p = matmul(invert2(fjac),p)
    x=x+p
    if (sum(abs(p)) <= tolx) exit

  end do

  if (n>=ntrial) call IO_abort('FE_find_point: did not converge')
  if ( abs(xi)<1.d0+TINY_XABS .and. abs(eta)<1.d0+TINY_XABS ) then
    istatus = 0
  else
    istatus = 1
  endif
  xi=x(1)
  eta=x(2)
  shap = FE_getshape(xi,eta,grid%ngnod)
  new_coord = matmul(coorg, shap)
  deallocate(coorg)

  end subroutine FE_find_point

!=====================================================================
!
! reorder grid data by element permutation
  subroutine FE_reorder(grid,perm,perm_inv)

  type(fem_grid_type), intent(inout) :: grid
  integer :: perm(grid%nelem), perm_inv(grid%nelem)

  integer :: k

 !devel: introduce tmp array to avoid stack switch ?
  grid%knods = grid%knods(:,perm)
  grid%tag = grid%tag(perm)
  do k=1,size(grid%bnds)
    grid%bnds(k)%elem=perm_inv( grid%bnds(k)%elem )
  enddo

  end subroutine FE_reorder

!=====================================================================
! Subroutines for Greedy Graph Coloring
!
! Coloring wrapper subroutine
!
! Default nthreads = 1
!
! when OMP is used, nthreads = OMP_NUM_THREADS
! OMP_NUM_THREADS is set as an environment variable when 
! compiling and launching the omp program
!

      subroutine FE_GreedyColoring(knods, Colors, ColorsA)
         implicit none
         Integer, intent(in) :: knods(:,:)
         Type(color), intent(out), pointer :: Colors(:)
         INTEGER, dimension(max_neighbor, size(knods, 2)) :: NEB
         INTEGER :: nthreads = 1, NColor, ColorsA(size(knods, 2))
         
!        get the total number of threads if OMP is used
!$       nthreads  = OMP_GET_NUM_THREADS()
         call FindNeighbors(knods, NEB)
		 call ColorByNeighbors(NEB, nthreads, ColorsA, NColor, Colors)
      end subroutine FE_GreedyColoring

!=====================================================================
! Subroutines for Greedy Graph Coloring
!
! find the neighbors using connectivity array knod
! ELEM: [NNODE_PER_ELEMENT, NEL], the knodes array in the fem grid
! NEB:  [max_neighbor, NEL], neighboring elements for each element, -1 are to be ignored 
!
      subroutine FindNeighbors(ELEM, NEB)
         implicit none
          INTEGER, INTENT(IN):: ELEM(:, :)
          INTEGER, INTENT(INOUT):: NEB(:,:)
          ! the first dimension of NEB must be large than 
          ! maximum number of neighbors, I set it to be max_neighbor
          INTEGER :: i, j, k, NEL, i_node, cnt_i, n2e(size(NEB, 1))
          INTEGER :: e_i, e_j,nnode
          INTEGER, allocatable :: node2el(:,:), cnt1(:)
          Integer, allocatable :: tmp(:)
          Integer :: cnt2(size(ELEM, 2)), nodes(size(ELEM, 1))

          NEL     = size(ELEM, 2)
          nnode   = maxval(ELEM) ! maximum node index  
          
		  ! max_neighbor are parameters defined in the module

          allocate(node2el(max_neighbor, nnode), cnt1(nnode))
          node2el = 0
          cnt1    = 0
          NEB     = -1
          cnt2    = 0

          ! build the array node2el
          do i = 1, NEL
              nodes = ELEM(:, i)
              do j = 1, size(nodes)
                  i_node = nodes(j)
                  ! (i, i_node) should be included in node2el
                  ! if not included then update both count and nodel2el
                  if (allocated(tmp)) deallocate(tmp)
                  tmp  = findloc(node2el(:, i_node),i)
                  if (size(tmp)==1 .and. tmp(1)==0) then
                      ! update the count of elements for each node 
                      cnt1(i_node) = cnt1(i_node) + 1
                      node2el(cnt1(i_node),i_node) = i
                  end if
              end do
          end do

          ! find the neighboring elements
          do i = 1, nnode
              n2e = node2el(:,i)
              cnt_i = cnt1(i) !# elements for each node
              do k = 1, cnt_i
                  e_i = n2e(k)
                  do j = k+1, cnt_i
                      e_j = n2e(j)
                      ! check if e_i, e_j has already been included
                      if (allocated(tmp)) deallocate(tmp)
                      tmp  = findloc(NEB(:, e_i), e_j)
                      if (size(tmp)==1 .and. tmp(1)==0) then
                          ! if not, include pair
                          cnt2(e_i) = cnt2(e_i) + 1
                          cnt2(e_j) = cnt2(e_j) + 1
                          NEB(cnt2(e_i), e_i) = e_j
                          NEB(cnt2(e_j), e_j) = e_i
                      end if
                  end do
              end do
          end do
          deallocate(node2el, cnt1, tmp)
      end subroutine FINDNeighbors

!=====================================================================
! Subroutines for Greedy Graph Coloring
!
! Color the FEM mesh by neighbors 
! NEB:  [max_neighbor, NEL], neighboring elements for each element, -1 are to be ignored 
! color the mesh for nthreads, return ColorsA and number of colors
! 
! ColorsA is an array of size [NEL]
!
      subroutine ColorByNeighbors(NEB, nthreads, ColorsA, NColor, Colors)
         implicit none
         INTEGER, INTENT(IN)  :: NEB(:,:), nthreads
         INTEGER, INTENT(OUT) :: NColor, ColorsA(size(NEB, 2))
 		 TYPE(color), POINTER, INTENT(OUT):: Colors(:)
         INTEGER :: NEL, i, j, ColorCount(size(NEB, 2)), ci, ei
         INTEGER :: BlockedColorsA(size(NEB,1)), Neighbors(size(NEB,1))
         LOGICAL :: isfree
         INTEGER, allocatable :: tmp(:)

          NEL        = size(NEB, 2)
          ColorsA     = 0
          ColorsA(1)  = 1
          NColor     = 1
          ColorCount = 0
          ColorCount(1) = 1

          ! loop through the second to the last element
          do i = 2, NEL
              BlockedColorsA = -1
              Neighbors = NEB(:, i)
              do j = 1, max_neighbor
                  if (Neighbors(j)<=0) cycle ! skip the jloop

                  ! check if the element has be colored
                  if (ColorsA(Neighbors(j)) /= 0) then
                      ! add this color to blocked
                      BlockedColorsA(j) = ColorsA(Neighbors(j))
                  end if

              end do !j

              ! loop through existing number of colors
              do j = 1, NColor
                  ! check if colorcount has reached nthreads
                  if (ColorCount(j) /= nthreads) then
                      if (allocated(tmp)) deallocate(tmp)
                      tmp  = findloc(BlockedColorsA, j)
                      isfree = size(tmp)==1 .and. tmp(1)==0
                      if (isfree) then
                          ! color elemment i with Color j
                          ColorsA(i) = j
                          ColorCount(j) = ColorCount(j) + 1
                          exit
                      end if
                  end if
              end do

              ! element i has not been colored
              ! either color(i) being blocked or have reached nthreads
              ! Color element i by a new color
              if (ColorsA(i)==0) then
                  NColor = NColor + 1
                  ColorsA(i) = NColor
                  ColorCount(NColor) = 1
              end if
          end do ! i

      deallocate(tmp)
      
      ! allocate memory for Colors
	  allocate(Colors(NColor))
      
      do i = 1, NColor 
          j = ColorCount(i)
		  Colors(i)%nelem = j 
		  allocate(Colors(i)%elem(j))
          ! parallel initialization, first touch
          !$OMP PARALLEL DO SCHEDULE(STATIC) 
          do ei =1, j
              Colors(i)%elem(ei) = 0
          end do
      end do
      
      ColorCount = 0
      ! populate Color(i)%elem with elements 
      do i = 1, NEL
         ! ci, color of the i-th element
         ci  = ColorsA(i)
         ! index of i-th element in the elements of color ci
  		 ColorCount(ci) = ColorCount(ci) + 1
         ei  = ColorCount(ci) 
         Colors(ci)%elem(ei) = i
      end do
      end subroutine ColorByNeighbors

end module fem_grid

