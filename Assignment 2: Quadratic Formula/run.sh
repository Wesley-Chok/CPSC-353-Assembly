#!/bin/bash

#Program: Quadratic Formula
#Author: Wesley Chok

rm *.o
rm *.out

echo "Compile Second_degree.c using gcc"
gcc -c -Wall -m64 -no-pie -o Second_degree.o Second_degree.c -std=c11

echo "Assemble Quadratic.asm"
nasm -f elf64 -l Quadratic.lis -o Quadratic.o Quadratic.asm

echo "Assembly ispositivefloat.asm"
nasm -f elf64 -l ispositivefloat.lis -o ispositivefloat.o ispositivefloat.asm

echo "Compile isdigit.cpp using g++"
g++ -c -m64 -Wall -fno-pie -no-pie -o isdigit.o isdigit.cpp -std=c++17

echo "Compile Quad_library.cpp using g++"
g++ -c -m64 -Wall -fno-pie -no-pie -o Quad_library.o Quad_library.cpp -std=c++17

echo "Link the object files using gcc"
gcc -m64 -no-pie -o quadEquation.out Second_degree.o Quadratic.o ispositivefloat.o isdigit.o Quad_library.o -std=c11

echo "Run the program Assignment 2: Quadratic Formula"
./quadEquation.out

echo "The script will terminate"