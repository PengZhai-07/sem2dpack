! SEM2DPACK version 2.3.4 -- A Spectral Element Method for 2D wave propagation and fracture dynamics,
!                            with emphasis on computational seismology and earthquake source dynamics.
! 
! Copyright (C) 2003-2007 Jean-Paul Ampuero
! All Rights Reserved
! 
! Jean-Paul Ampuero
! 
! California Institute of Technology
! Seismological Laboratory
! 1200 E. California Blvd., MC 252-21 
! Pasadena, CA 91125-2100, USA
! 
! ampuero@gps.caltech.edu
! Phone: (626) 395-6958
! Fax  : (626) 564-0715
! 
! http://www.seismolab.caltech.edu
! 
! 
! This software is freely available for academic research purposes. 
! If you use this software in writing scientific papers include proper 
! attributions to its author, Jean-Paul Ampuero.
! 
! This program is free software; you can redistribute it and/or
! modify it under the terms of the GNU General Public License
! as published by the Free Software Foundation; either version 2
! of the License, or (at your option) any later version.
! 
! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
! 
! You should have received a copy of the GNU General Public License
! along with this program; if not, write to the Free Software
! Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
! 
module mesh_cartesian

! MESH_CARTESIAN: generation of a rectangular mesh

!-- Renumbering of elements by Reverse Cuthill-McKee algorithm --
!   to improve data locality (optimize cache usage)
  use constants, only : OPT_RENUMBER, NDIME

  implicit none
  private

  type domain_type
    integer :: tag,ex(2),ez(2)
  end type domain_type

  type mesh_cart_type
    private
    double precision :: xmin,xmax,zmin,zmax
    integer :: ndom,nz,nx,ezflt
    type (domain_type), pointer :: domains(:) 
  end type mesh_cart_type

  public :: mesh_cart_type,CART_read,CART_build

  integer, parameter :: NGNOD = 4

contains

!=====================================================================
!
! BEGIN INPUT BLOCK
!
! NAME   : MESH_CART
! GROUP  : MESH_DEF
! PURPOSE: Rectangular box with structured mesh.
! SYNTAX : &MESH_CART xlim, zlim, nelem, ezflt, FaultX /
!
! ARG: xlim     [dble(2)] [none] X limits of the box (min and max)
! ARG: zlim     [dble(2)] [none] Z limits of the box (min and max)
! ARG: nelem    [int(2)] [none]  Number of elements along each direction
! ARG: ezflt    [int][0] introduce a horizontal fault between the ezflt-th
!               and the (ezflt+1)-th element rows. 
!		If ezflt=0, no fault is introduced (default). 
!		If ezflt=-1, a fault is introduced at (or near) the middle of the box
! ARG: FaultX   [log] [F] (obsolete, will be deprecated, same as ezflt=-1)
!
! NOTE: the following tags are automatically assigned to the boundaries: 
!               1       Bottom 
!               2       Right        
!               3       Top  
!               4       Left
!               5       Fault, bottom side
!               6       Fault, top side
!
! END INPUT BLOCK


! BEGIN INPUT BLOCK
!
! NAME   : MESH_CART_DOMAIN
! PURPOSE: Define a subdomain within a structured meshed box.
! SYNTAX : &MESH_CART_DOMAIN tag,ex,ez /
!
! ARG: tag      [int] [none] Tag number assigned to this domain. 
! ARG: ex       [int(2)] [none]  First and last element along the X direction.
! ARG: ez       [int(2)] [none]  First and last element along the Z direction.
!
! NOTE   : If you ignore this input block a single domain (tag=1) will span 
!          the whole box 
!
! END INPUT BLOCK


subroutine CART_read(mesh,iin)

  use stdio, only : IO_abort
  use echo, only : echo_input, iout

  type(mesh_cart_type), intent(out) :: mesh
  integer, intent(in) :: iin

  double precision :: init_double,xlim(2),zlim(2)
  integer :: nelem(2),ezflt,nx,nz,tag,ex(2),ez(2),n_domains,i
  logical :: FaultX

  NAMELIST / MESH_CART /  xlim,zlim,nelem,FaultX,ezflt
  NAMELIST / MESH_CART_DOMAIN / tag,ex,ez

  init_double = huge(init_double)
  xlim = (/ 0.d0,init_double /)
  zlim = xlim
  nelem = 0
  FaultX = .false.
  ezflt = 0
  
  rewind(iin)
  read(iin,MESH_CART,END=100)

  if (xlim(2) == init_double) call IO_abort('CART_read: you must set xlim')
  if (zlim(2) == init_double) call IO_abort('CART_read: you must set zlim')
  nx = nelem(1)
  nz = nelem(2)
  if (nx <= 0) call IO_abort('CART_read: nx must be positive')
  if (nz <= 0) call IO_abort('CART_read: nz must be positive')
  if (FaultX) ezflt=-1
  if (ezflt== -1) ezflt = nz/2

  if (echo_input) then
    write(iout,200) xlim, zlim, nelem
    if (ezflt>0) write(iout,210) ezflt
  endif

  mesh%xmin = xlim(1)
  mesh%xmax = xlim(2)
  mesh%zmin = zlim(1)
  mesh%zmax = zlim(2)
  mesh%nx   = nx
  mesh%nz   = nz
  mesh%ezflt = ezflt

 ! Count the domains
  rewind(iin)
  n_domains = 0
  do 
    read(iin,MESH_CART_DOMAIN,END=110)
    n_domains = n_domains + 1
  enddo 
110 continue

  if (n_domains == 0) then
   ! A single domain spans the whole box
    mesh%ndom = 1
    allocate(mesh%domains(1))
    mesh%domains(1)%tag = 1
    mesh%domains(1)%ex  = (/ 1,nx /)
    mesh%domains(1)%ez  = (/ 1,nz /)

  else

    mesh%ndom = n_domains
    allocate(mesh%domains(n_domains))

    rewind(iin)
    do i=1,n_domains
      
      tag  = 0
      ex = 0
      ez = 0
      
      read(iin,MESH_CART_DOMAIN)

      if (tag<1) call IO_abort('CART_read: tag null, negative or missing')
      if (ex(1)<1 .or. ex(1)>nx) call IO_abort('CART_read: ex(1) out of bounds or missing')
      if (ex(2)<1 .or. ex(2)>nx) call IO_abort('CART_read: ex(2) out of bounds or missing')
      if (ez(1)<1 .or. ez(1)>nz) call IO_abort('CART_read: ez(1) out of bounds or missing')
      if (ez(2)<1 .or. ez(2)>nz) call IO_abort('CART_read: ez(2) out of bounds or missing')

      mesh%domains(i)%tag = tag
      mesh%domains(i)%ex  = ex
      mesh%domains(i)%ez  = ez

    enddo
  endif

  return
100 call IO_abort('CART_read: input block not found')

200 format(5x, &
      'Minimum X . . . . . . . . . . . . . . (xlim(1)) = ',1pe10.3,/5x, &
      'Maximum X . . . . . . . . . . . . . . (xlim(2)) = ',1pe10.3,/5x, &
      'Minimum Z . . . . . . . . . . . . . . (zlim(1)) = ',1pe10.3,/5x, &
      'Maximum Z . . . . . . . . . . . . . . (zlim(2)) = ',1pe10.3,/5x, &
      'Number of elements along X. . . . . .(nelem(1)) = ',I0,/5x, &
      'Number of elements along Z. . . . . .(nelem(2)) = ',I0)

210 format(5x, &
      'Fault on top of this element row  . . . (ezflt) = ',I0)

end subroutine CART_read

!=====================================================================
! CART_BUILD:
!

subroutine CART_build(mesh,grid)

  use fem_grid, only : fem_grid_type
  use mesh_structured
  use memory_info
  use stdio, only : IO_abort
  use utils, only : sub2ind

  type(mesh_cart_type), intent(in) :: mesh
  type(fem_grid_type), intent(inout) :: grid

  double precision, allocatable :: x(:),z(:)
  integer :: nxp,nzp,i,j,ilast,ifirst,idom

  nxp = mesh%nx+1 
  if (mesh%ezflt>0) then 
    nzp = mesh%nz+2
  else
    nzp = mesh%nz+1
  endif
  grid%npoin = nxp*nzp
  grid%ngnod = NGNOD
  grid%nelem = mesh%nx*mesh%nz
  grid%flat  = .true.

  ! Allocations
  allocate(grid%coord(NDIME,grid%npoin))
  allocate(grid%knods(grid%ngnod,grid%nelem))
  allocate(grid%tag(grid%nelem))
  call storearray('coorg',size(grid%coord),idouble)
  call storearray('knods',size(grid%knods),iinteg)
  call storearray('tag',size(grid%tag),iinteg)
  
  ! Coordinates of control nodes
  allocate(x(nxp))
  allocate(z(nzp))
  x = mesh%xmin +(mesh%xmax-mesh%xmin)/dble(mesh%nx) *(/ (i, i=0,nxp-1) /)
  if (mesh%ezflt>0) then 
    z = mesh%zmin +(mesh%zmax-mesh%zmin)/dble(mesh%nz) &
               *(/ (j, j=0,mesh%ezflt), (j, j=mesh%ezflt,mesh%nz) /)
  else
    z = mesh%zmin +(mesh%zmax-mesh%zmin)/dble(mesh%nz) *(/ (j, j=0,mesh%nz) /) 
  endif
  ilast  = 0
  do j=1,nzp
    ifirst = ilast + 1
    ilast  = ilast + nxp
    grid%coord(1, ifirst:ilast ) = x
    grid%coord(2, ifirst:ilast ) = z(j)
  enddo
  deallocate(x,z)
  
 ! Domain tags, usually for material sets
  grid%tag = 0
  do idom=1,mesh%ndom
    do i=mesh%domains(idom)%ex(1),mesh%domains(idom)%ex(2)
    do j=mesh%domains(idom)%ez(1),mesh%domains(idom)%ez(2)
      grid%tag( sub2ind(i,j,mesh%nx) ) = mesh%domains(idom)%tag
    enddo
    enddo
  enddo
  if (any(grid%tag == 0)) call IO_abort('CART_build: Domain tags not entirely set')

 ! Control nodes of each element
 ! Elements are sequentially numbered horizontally from bottom-left to top-right
  call MESH_STRUCTURED_connectivity(grid%knods,mesh%nx,mesh%nz,grid%ngnod,mesh%ezflt)
  
 ! Boundary conditions
  if (mesh%ezflt>0) then
    allocate(grid%bnds(6))
  else
    allocate(grid%bnds(4))
  endif
  call MESH_STRUCTURED_boundaries(grid%bnds,mesh%nx,mesh%nz,mesh%ezflt)

 ! Renumber elements
  if (OPT_RENUMBER) call MESH_STRUCTURED_renumber(grid,mesh%nx,mesh%nz)

end subroutine CART_build

end module mesh_cartesian
