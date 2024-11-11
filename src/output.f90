! 結果出力用ファイル
module mod_output
  use prm
  implicit none

contains

  subroutine output()
    integer :: igrid,kgrid

    ! resultsディレクトリの作成
    call makeOutDir()

    ! シミュレーション条件の出力
    open(11,file="./results/calculate_condition.dat")

    write(11,*) "xmesh",":",xmesh
    write(11,*) "zmesh",":",zmesh
    write(11,*) "dx",":",dx
    write(11,*) "dz",":",dz
    write(11,*) "lreal",":",lreal

    close(11)

    ! 磁場の出力
    open(11,file="./results/B.csv")

    write(11,'(*(a,:,","))') "posx","posz","Bx","Bz"

    do igrid = 0,xmesh
      do kgrid = 0,zmesh
        write(11,'(*(es12.3e2,:, ","))') igrid*dx, kgrid*dz, B(igrid,kgrid,1), B(igrid,kgrid,3)
      enddo
    enddo

    close(11)
  end subroutine output

  
  ! Make output directory
  subroutine makeOutDir()
    call mkdir("./results")

  contains
    subroutine mkdir(dir_name)
      character(LEN=*) :: dir_name
      character*512 :: command
      external system

      write(command,'(10a)') 'if [ ! -d ', trim(dir_name),' ]; then &
          &   (mkdir -p ', trim(dir_name), '); fi'

      call system(command)
    end subroutine mkdir
  end subroutine makeOutDir
end module mod_output
