! SEM2DPACK version 2.2.3 -- A Spectral Element Method tool for 2D wave propagation
!                            and earthquake source dynamics
! 
! Copyright (C) 2003 Jean-Paul Ampuero
! All Rights Reserved
! 
! Jean-Paul Ampuero
! 
! ETH Zurich (Swiss Federal Institute of Technology)
! Institute of Geophysics
! Seismology and Geodynamics
! ETH H�nggerberg (HPP)
! CH-8093 Z�rich
! Switzerland
! 
! ampuero@erdw.ethz.ch
! +41 1 633 2197 (office)
! +41 1 633 1065 (fax)
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
module plot_gen

  use plot_visual3
  use plot_avs
  use plot_postscript

  implicit none
  private

  integer, parameter :: nb_fields = 5
  logical, save :: visual3,avs,postscript,bin
  logical, save :: selected_fields(nb_fields)

  public :: read_plot_gen,PLOT_FIELD

contains

!=======================================================================
!
! BEGIN INPUT BLOCK
!
! NAME   : PLOTS
! PURPOSE: Selects a format to export snapshots
! SYNTAX : &PLOTS visual3,avs,postscript,fields /
!
! ARG: fields   [char*] ['V'] Which fields to export in snapshots
!                       (in parenthesis: field code of output files)
!                               'D'     displacements (dx,dz)
!                               'V'     velocity (vx,vz)
!                               'A'     acceleration (ax,az)
!                               'E'     strain (e11,e22,e12)
!                               'S'     stress (s11,s22,s12,s33)
! ARG: postscript [log] [T] PostScript
! ARG: avs      [log] [F] AVS
! ARG: visual3  [log] [F] Visual3
! ARG: bin      [log] [T] binary
!               
! NOTE   : if you choose PostScript you may want to provide a $POSTSCRIPT input block
!          Other formats apply only for 'DVA' fields, 'ES' are exported as binary.
!
! NOTE   : Visual3 and AVS have not been tested/checked recently
!
! END INPUT BLOCK

  subroutine read_plot_gen(iin)
  
  use echo, only : iout,echo_input
  integer, intent(in) :: iin
  character(nb_fields) :: fields,field_names='DVAES'

  integer :: i

  NAMELIST / PLOTS / visual3,avs,postscript,bin,fields

  visual3    = .false.
  avs        = .false.
  postscript = .true.
  bin        = .true.
  fields     = 'V'
  
  rewind(iin)
  read(iin,PLOTS,END=100) 
100 continue

  do i=1,nb_fields
    selected_fields(i) = scan(fields,field_names(i:i)) > 0
  enddo
  
  if (echo_input) write(iout,200) postscript,avs,visual3,bin,selected_fields(:)

  if (postscript) call POST_PS_read(iin)

  return

  200 format(//1x,'P l o t   C o n t r o l   c a r d',/1x,34('='),//5x,&
  'Save results in PS file or not . . . . .(postscript) = ',L1/5x, &
  'Save results in AVS file or not. . . . . . . . (avs) = ',L1/5x, &
  'Save results in Visual3 file or not. . . . (visual3) = ',L1/5x, &
  'Save results in binary file or not . . . . . . (bin) = ',L1/5x, &
  'Selected field (fields) :',/7x, &
  'Displacement . . . . . . . . . . . . . . . . . . . = ',L1/5x, &
  'Velocity . . . . . . . . . . . . . . . . . . . . . = ',L1/5x, &
  'Acceleration . . . . . . . . . . . . . . . . . . . = ',L1/5x, &
  'Strain . . . . . . . . . . . . . . . . . . . . . . = ',L1/5x, &
  'Stress . . . . . . . . . . . . . . . . . . . . . . = ',L1)

  end subroutine read_plot_gen


!=======================================================================

  subroutine PLOT_FIELD(pb,tag,it,stitle)

  use problem_class
  use stdio, only : IO_rw_field
  use elastic, only : ELAST_strain_stress

  type(problem_type), intent(in) :: pb
  integer, intent(in) :: it
  character(*), intent(in) :: stitle,tag

  double precision, pointer :: f(:,:)
  double precision, allocatable :: ssf(:,:,:,:)
  character(30) :: fnames(10)
  character :: fchar
  integer :: i,nssf

  do i = 1,3

    if (.not.selected_fields(i)) cycle

   ! Select the displayed field
    select case(i)
      case(1)
        f => pb%fields%displ
        fchar = 'd'
      case(2)
        f => pb%fields%veloc
        fchar = 'v'
      case(3)
        f => pb%fields%accel
        fchar = 'a'
    end select

    write(fnames(1),'(A,"x_",A)') fchar,trim(tag) 
    write(fnames(2),'(A,"z_",A)') fchar,trim(tag) 

    if (postscript) &
      call PLOT_PS(vfield=f,it_in=it,time_in=pb%time%time &
                  ,grid=pb%grid,elast=pb%elast,stitle=stitle &
                  ,src=pb%src,rec=pb%rec)
    if (avs) call plotavs(f,pb%grid,it)
    if (visual3) call plotvisual3(f,pb%grid,pb%elast,it)
    if (bin) call IO_rw_field(f,fnames(1:2),'w')

  enddo

  if (selected_fields(4) .or. selected_fields(5)) then
    nssf = 0
    if (selected_fields(4)) then
      nssf=3
      write(fnames(1),'("e11_",A)') trim(tag) 
      write(fnames(2),'("e22_",A)') trim(tag) 
      write(fnames(3),'("e12_",A)') trim(tag) 
    endif
    if (selected_fields(5)) then
      write(fnames(nssf+1),'("s11_",A)') trim(tag) 
      write(fnames(nssf+2),'("s22_",A)') trim(tag) 
      write(fnames(nssf+3),'("s33_",A)') trim(tag) 
      write(fnames(nssf+4),'("s12_",A)') trim(tag) 
      nssf=nssf+4
    endif
    allocate(ssf(pb%grid%ngll,pb%grid%ngll,pb%grid%nelem,nssf))
    call ELAST_strain_stress(pb%elast,pb%grid,pb%fields%displ, &
                             selected_fields(4),selected_fields(5),ssf)
    call IO_rw_field(ssf,fnames,'w')
    deallocate(ssf)
  endif
  
  end subroutine PLOT_FIELD
  
end module plot_gen
