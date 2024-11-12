! パラメータ用ファイル
module prm
  use magnet_type

  ! 円周率
  double precision,parameter :: PI = 3.14159265
  ! 真空の透磁率
  double precision,parameter :: MU = 1.25663706d-6
  ! x方向のメッシュ数(グリッド数-1)
  integer,parameter :: xmesh = 80
  ! z方向のメッシュ数(グリッド数-1)
  integer,parameter :: zmesh = 80
  ! x方向のメッシュの規格化サイズ
  double precision,parameter :: dx = 0.5d0
  ! z方向のメッシュの規格化サイズ
  double precision,parameter :: dz = 0.5d0
  ! 各グリッドの磁場(3次元)
  double precision :: B(0:xmesh,0:zmesh,1:3)
  ! 実際の装置サイズ
  ! lrealよりもlpicの方が良いかも（要検討）
  double precision,parameter :: lreal = 1.d-4
  ! 磁石の数
  integer,parameter :: magnet_num = 2
  ! 磁石の情報（magnet_type.f90参照）
  type(Magnet) :: magnets(1:magnet_num) = (/&
    &Magnet('L','N',zmesh*dz/2,5.d-8,dz),&
    &Magnet('R','S',zmesh*dz/2,5.d-8,dz)&
  &/)
end module prm
