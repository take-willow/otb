! 特定位置における磁場を計算し、返す
module mod_pos_to_B
  use prm
  use mod_vector_utilities
  implicit none

contains

  ! 規格化位置posを受け取り、その位置における磁場を返す
  function posToB(pos)
    double precision,intent(in) :: pos(1:3)
    double precision :: posToB(1:3)
    double precision :: l1,l2
    integer :: mesh(1:3)
    
    if(pos(1).lt.0.d0 .or. pos(1).ge.xmesh*dx) then
      write(*,*) "Invalid input.(xpos)"
      stop 1
    endif
    if(pos(3).lt.0.d0 .or. pos(3).ge.zmesh*dz) then
      write(*,*) "Invalid input.(zpos)"
      stop 1
    endif

    ! 所属メッシュを計算
    mesh = (/ idint(pos(1)/dx)+1, 0, idint(pos(3)/dz)+1 /)
    
    ! 周辺グリッドの磁場から計算
    posToB = 0.d0
    l1 = pos(1)-(mesh(1)-1)*dx
    l2 = pos(3)-(mesh(3)-1)*dz
    posToB = addVector(posToB,scalarProduct((1-l1)*(1-l2),B(mesh(1)-1,mesh(3)-1,1:3)))
    posToB = addVector(posToB,scalarProduct(l1*(1-l2),B(mesh(1),mesh(3)-1,1:3)))
    posToB = addVector(posToB,scalarProduct((1-l1)*l2,B(mesh(1)-1,mesh(3),1:3)))
    posToB = addVector(posToB,scalarProduct(l1*l2,B(mesh(1),mesh(3),1:3)))
  end function posToB
end module mod_pos_to_B
