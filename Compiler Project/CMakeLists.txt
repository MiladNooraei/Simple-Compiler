cmake_minimum_required(VERSION 3.24)
project(Compiler_Project C)

set(CMAKE_C_STANDARD 11)

add_executable(Compiler_Project lex.yy.c y.tab.c)
