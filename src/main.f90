! サブルーチンの呼び出し元
program main
  use mod_calc_current
  use mod_pos_to_B
  use mod_output
  use prm
  implicit none

  integer :: imag
  double precision :: pos(1:3)
  
  ! 磁場の初期化
  B = 0.d0

  ! 磁場の計算
  do imag = 1,magnet_num
    call calcCurrent(magnets(imag))
  enddo

  ! 結果の出力
  call output()

  ! posToBのお試し
  pos = (/ 1.2, 0.0, 3.6 /)
  write(*,*) posToB(pos)
end program main
