! ベクトル演算用サブルーチンが格納されたファイル
module mod_vector_utilities
  implicit none

contains

  ! Return vector sum
  function addVector(vec_a,vec_b)
    double precision,intent(in) :: vec_a(1:3)
    double precision,intent(in) :: vec_b(1:3)
    double precision :: addVector(1:3)

    addVector = (/ vec_a(1)+vec_b(1), vec_a(2)+vec_b(2), vec_a(3)+vec_b(3) /)
  end function addVector


  ! Return vector difference
  function subtractVector(vec_a,vec_b)
    double precision,intent(in) :: vec_a(1:3)
    double precision,intent(in) :: vec_b(1:3)
    double precision :: subtractVector(1:3)

    subtractVector = (/ vec_a(1)-vec_b(1), vec_a(2)-vec_b(2), vec_a(3)-vec_b(3) /)
  end function subtractVector


  ! Return scalar-vector product
  function scalarProduct(scalar,vec)
    double precision,intent(in) :: scalar
    double precision,intent(in) :: vec(1:3)
    double precision :: scalarProduct(1:3)

    scalarProduct = (/ scalar*vec(1), scalar*vec(2), scalar*vec(3) /)
  end function scalarProduct


  ! Return inner product
  function innerProduct(vec_a,vec_b)
    double precision,intent(in) :: vec_a(1:3)
    double precision,intent(in) :: vec_b(1:3)
    double precision :: innerProduct

    innerProduct = vec_a(1)*vec_b(1)+vec_a(2)*vec_b(2)+vec_a(3)*vec_b(3)
  end function innerProduct


  ! Return outer product
  function outerProduct(vec_a,vec_b)
    double precision,intent(in) :: vec_a(1:3),vec_b(1:3)
    double precision :: outerProduct(1:3)

    outerProduct=(/vec_a(2)*vec_b(3)-vec_a(3)*vec_b(2),vec_a(3)*vec_b(1)-vec_a(1)*vec_b(3),vec_a(1)*vec_b(2)-vec_a(2)*vec_b(1)/)
  end function outerProduct

end module mod_vector_utilities