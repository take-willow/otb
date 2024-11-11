! 電流素片が作る磁場を求め、磁場配列Bに加算する
module mod_calc_B
  use prm
  use mod_vector_utilities
  implicit none

contains

  ! magnet_posに存在する電流量current_yの電流素片についての計算
  subroutine calcB(current_pos,current_y)
    double precision,intent(in) :: current_pos(1:3)
    double precision,intent(in) :: current_y
    double precision :: grid_pos(1:3),dpos(1:3),current(1:3),b_grid(1:3)
    double precision :: len_dpos
    integer :: igrid,kgrid

    current = (/ 0.d0, current_y, 0.d0 /)

    do igrid = 0,xmesh
      do kgrid = 0,zmesh
        grid_pos = (/ igrid*dx, 0.d0, kgrid*dz /)
        dpos = subtractVector(grid_pos,current_pos)
        ! 実際の長さに変換
        dpos = (/ dpos(1)*lreal/(xmesh*dx), 0.d0, dpos(3)*lreal/(zmesh*dz) /)
        len_dpos = sqrt(innerProduct(dpos,dpos))
        ! 電流素片がグリッドに作る磁場を計算
        b_grid = scalarProduct(MU/(4*PI*(len_dpos**3.d0)),outerProduct(current,dpos))
        ! Bに加算
        B(igrid,kgrid,1:3) = addVector(B(igrid,kgrid,1:3),b_grid)
      enddo
    enddo
  end subroutine calcB
end module mod_calc_B
