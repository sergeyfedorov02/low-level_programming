cmake_minimum_required(VERSION 3.17)
project(lab4 C)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -static-libstdc++ -static-libgcc")
set(CMAKE_C_STANDARD 99)

add_executable(lab4 main.c main.h search.c)