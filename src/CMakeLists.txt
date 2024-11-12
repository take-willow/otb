cmake_minimum_required(VERSION 3.10)

enable_language(Fortran)

project(otb.exe Fortran)

set(CMAKE_Fortran_COMPILER ifx)
set(CMAKE_Fortran_FLAGS "-O -g -traceback -ftrapuv")

add_executable(${CMAKE_PROJECT_NAME}

  calc_B.f90
  calc_current.f90
  magnet_type.f90
  main.f90
  output.f90
  pos_to_B.f90
  prmfl.f90
  vector.f90

)

target_compile_options(${CMAKE_PROJECT_NAME} PUBLIC -fpp)
