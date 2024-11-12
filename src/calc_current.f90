! 磁石を電流素片に分解し、磁場計算を行う
module mod_calc_current
  use mod_calc_B
  use prm
  use magnet_type
  implicit none

contains

  ! z方向の周期境界条件を考慮し、前後周期分のみ影響するものとして計算
  subroutine calcCurrent(mg)
    type(Magnet),intent(in) :: mg
    double precision :: current_pos(1:3),current_y
    integer :: icycle

    ! 電流量の設定
    if((mg%wall.eq.'L' .and. mg%pole.eq.'N') .or. (mg%wall.eq.'R' .and. mg%pole.eq.'S')) then
      current_y = mg%strength/((mg%width*lreal/(zmesh*dz))*1)
    else if((mg%wall.eq.'L' .and. mg%pole.eq.'S') .or. (mg%wall.eq.'R' .and. mg%pole.eq.'N')) then
      current_y = -mg%strength/((mg%width*lreal/(zmesh*dz))*1)
    else
      write(*,*) "Invalid input.(pole)"
      stop 1
    endif

    ! icycle = -1:前周期分, 0:同一周期分, 1:後周期分
    do icycle = -1,1

      ! 電流素片の座標を初期化
      current_pos = 0.d0
      ! 壁に応じたx座標を設定
      if(mg%wall.eq.'L') then
        current_pos(1) = -dx/2
      elseif(mg%wall.eq.'R') then
        current_pos(1) = xmesh*dx+dx/2
      else
        write(*,*) "Invalid input.(wall)"
        stop 1
      endif

      ! z座標を設定
      if(mg%position.lt.0.d0 .or. mg%position.gt.zmesh*dz) then
        write(*,*) "Invalid input.(position)"
        stop 1
      else
        ! 上側電流素片
        current_pos(3) = mg%position+icycle*zmesh*dz+mg%width/2
        call calcB(current_pos,-current_y)
        ! 下側電流素片
        current_pos(3) = mg%position+icycle*zmesh*dz-mg%width/2
        call calcB(current_pos,current_y)
      endif
    enddo
  end subroutine calcCurrent
end module mod_calc_current
