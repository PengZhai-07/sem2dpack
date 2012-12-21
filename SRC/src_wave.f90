! SEM2DPACK version 2.2.11 -- A Spectral Element Method for 2D wave propagation and fracture dynamics,
!                             with emphasis on computational seismology and earthquake source dynamics.
! 
! Copyright (C) 2003-2007 Jean-Paul Ampuero
! All Rights Reserved
! 
! Jean-Paul Ampuero
! 
! ETH Zurich (Swiss Federal Institute of Technology)
! Institute of Geophysics
! Seismology and Geodynamics Group
! ETH H�nggerberg HPP O 13.1
! CH-8093 Z�rich
! Switzerland
! 
! ampuero@erdw.ethz.ch
! +41 44 633 2197 (office)
! +41 44 633 1065 (fax)
! 
! http://www.sg.geophys.ethz.ch/geodynamics/ampuero/
! 
! 
! This software is freely available for scientific research purposes. 
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
module src_wave

! Incident plane wave
! The velocity time function is a ricker
!
! Incident wave velocity vector:
!   V = f(t-K*X/c) P
! where 
!   f = source time function,
!   c = wave speed (P or S),
!   K = propagation vector, 
!   X = position vector,
!   P = polarization vector 
!
! Strain: 
!   E = -0.5*f/c *( K*transpose(P) + P*transpose(K) )
!   trace(E) = -f/c dot(K,P)
!
! Stress:
!   S = lambda*trace(E)*Id + 2*mu*E
!
! Traction at absorbing boundary (unit normal vector N): 
!   T = S*N
!     = -f/c *( lambda*dot(K,P) N +mu*( dot(P,N) K + dot(K,N) P ))
!
!  .Case SH: P = Y (out-of-plane)
!     T = -mu/c*f*dot(K,N) Y
!   
!  .Case P: P = K
!     T = -f/c*( lambda N + 2*mu*dot(K,N) K ) 
!
!  .Case SV: P = normal to K
!     T = -mu/c*f*( dot(P,N) K + dot(K,N) P )

  use stf_ricker
  use constants, only : NDIME, PI

  implicit none 
  private

  type src_wave_type
    private
    double precision,dimension(NDIME) :: p,k,s,coord 
    double precision :: cs,cp,angle,mu,lambda
    character :: phase
  end type src_wave_type

  public :: src_wave_type,WAVE_read,WAVE_init,SRC_WAVE_get_VT,SRC_WAVE_get_phase

contains

!----------------------------------------------------------------------
!
! BEGIN INPUT BLOCK
!
! NAME   : SRC_WAVE
! GROUP  : SRC_MECHANISM
! PURPOSE: Incident plane wave through the absorbing boundaries
! SYNTAX : &SRC_WAVE angle, phase /
!
! ARG: angle    [dble] [0d0]    Incidence angle (arrival direction)
!                 in degrees counterclockwise from the positive Z (up) direction: 
!                 Incidence from below: angle in ]-90,90[
!                 (e.g. 0 is normal incidence from below,
!                 +45 comes from bottom right, -45 comes from bottom left)
! ARG: phase    [char] ['S']    'S' or 'P' (only needed in PSV, ignored in SH)
!
! NOTE   : Incident waves enter through the absorbing boundaries.
!          An incident wave is applied on every absorbing boundary
!          unless "let_wave = F" in the respective BC_ABSO block.
!          Incident waves are not implemented for "Stacey" absorbing boundaries.
!
! END INPUT BLOCK

!
subroutine WAVE_read(src,iin)

  use echo, only : echo_input,iout
  use stdio, only : IO_abort

  type (src_wave_type), intent(out) :: src
  integer, intent(in) :: iin

  double precision :: angle
  character :: phase  
  
  NAMELIST / SRC_WAVE / angle,phase

  angle = 0d0
  phase = 'S'

  read(iin,SRC_WAVE,END=200)
  if (echo_input) write(iout,100) angle,phase

  if (phase/='P' .and. phase/='S') call IO_abort('WAVE_read: phase must be S or P') 

  src%angle = angle
  src%phase = phase
  
  return

 100 format(//,5x, &
     'Source Type. . . . . . . . (mechanism) = plane wave',/5x, &
     'Incidence angle  . . . . . . . (angle) = ',F0.1,/5x, &
     'Phase. . . . . . . . . . . . . (phase) = ',A,/5x)
 200 call IO_abort('WAVE_read: SRC_WAVE input block not found')

end subroutine WAVE_read


!-------------------------------------------------------------------
! Initializes the incident wave
!
! NOTE: we assume that at t=0 the wave is completely outside the domain.
! Otherwise we should set the initial fields analytically, 
! e.g. for homogeneous media:
!  do ip=1,grid%npoin
!    phase = - DOT_PRODUCT( grid%coord(:,ip) - wave%coord , wave%k )
!    fields%displ(ip,:) = wave%p * ricker_int(phase,timef)
!    fields%veloc(ip,:) = wave%p * ricker(phase,timef)
!    fields%accel(ip,:) = wave%p * ricker_deriv(phase,timef)
!  enddo
! ... but this cannot be done in heterogeneous medium.
! 
subroutine WAVE_init(wave,grid,elast,coord)

  use echo, only: echo_init,iout
  use spec_grid, only : sem_grid_type,SE_node_belongs_to,SE_find_nearest_node
  use elastic, only : elast_type,ELAST_inquire

  type (src_wave_type), intent(inout) :: wave
  type (sem_grid_type), intent(in)    :: grid
  type (elast_type)   , intent(in)    :: elast
  double precision    , intent(out)   :: coord(NDIME) ! coord of reference point

  double precision :: cp,cs,phase,angle,c
  integer :: ip, iglob
  integer, pointer, dimension(:) :: i,j,e

  coord(2) = minval(grid%coord(2,:))
  if (wave%angle>0) then
    coord(1) = maxval(grid%coord(1,:))
  else
    coord(1) = minval(grid%coord(1,:))
  endif

  call SE_find_nearest_node(coord,grid,iglob,coord)
  wave%coord = coord

  call SE_node_belongs_to(iglob,e,i,j,grid)
  call ELAST_inquire(elast,i(1),j(1),e(1),cp=wave%cp,cs=wave%cs,mu=wave%mu,lambda=wave%lambda)
  deallocate(i,j,e)

  angle = PI*wave%angle/180.d0
  wave%k = (/ -sin(angle), cos(angle) /)
  select case (wave%phase)
    case('P')
      wave%p = (/ -sin(angle), cos(angle) /)
      c = wave%cp
    case('S')
      wave%p = (/ cos(angle), sin(angle) /)
      c = wave%cs
  end select
  wave%s = wave%k/c

  if (echo_init) then
    write(iout,'(2X,A,EN12.3,A)') 'Incident wave phase velocity = ',c,' m/s' 
    write(iout,'(2X,A,2EN12.3)') 'Reference point = ',wave%coord
  endif

end subroutine WAVE_init


!----------------------------------------------------------------------------
function SRC_WAVE_get_phase(wave,time,coord) result(phase)

  type (src_wave_type), intent(in) :: wave
  double precision, intent(in) :: time,coord(NDIME)
  double precision :: phase

  phase = time - (coord(1)-wave%coord(1))*wave%s(1) - (coord(2)-wave%coord(2))*wave%s(2)
  
end function SRC_WAVE_get_phase

!----------------------------------------------------------------------------

subroutine SRC_WAVE_get_VT(Vin,Tin,N,wave)

  double precision, intent(out) :: Vin(:,:), Tin(:,:) ! [npoin,ndof]
  double precision, intent(in) :: N(:,:)  ! [npoin,ndime]
  type (src_wave_type), intent(in) :: wave

  double precision, dimension(size(N,1)) :: KN,PN

  KN = wave%K(1)*N(:,1) + wave%K(2)*N(:,2) ! dot(K,N)

  if (size(Vin,2)==1) then
    Vin(:,1) = 1d0
    Tin(:,1) = -wave%mu/wave%cs*KN

  else
    Vin(:,1) = wave%p(1)
    Vin(:,2) = wave%p(2)
    select case (wave%phase)
      case('P') !     T = -f/c*( lambda N + 2*mu*dot(K,N) K ) 
        Tin(:,1) = -1d0/wave%cp*( wave%lambda*N(:,1) +2d0*wave%mu*KN*wave%K(1) )
        Tin(:,2) = -1d0/wave%cp*( wave%lambda*N(:,2) +2d0*wave%mu*KN*wave%K(2) )
      case('S') !     T = -mu/c*f*( dot(P,N) K + dot(K,N) P )
        PN = wave%P(1)*N(:,1) + wave%P(2)*N(:,2) ! dot(P,N)
        Tin(:,1) = -wave%mu/wave%cs*( PN*wave%K(1) + KN*wave%P(1) )
        Tin(:,2) = -wave%mu/wave%cs*( PN*wave%K(2) + KN*wave%P(2) )
    end select

  endif

end subroutine SRC_WAVE_get_VT


end module src_wave
