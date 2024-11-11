! 磁石の情報を一元的に管理するためのタイプを定義するファイル
module magnet_type
  implicit none

  type Magnet
    character*1 :: wall             ! L:左壁, R:右壁
    character*1 :: pole             ! NかS
    double precision :: position    ! 規格化位置
    double precision :: strength    ! 磁気モーメント / Am^2
    double precision :: width       ! 幅
  end type Magnet
end module magnet_type
