#!/bin/bash

#Program: Perimeter of Rectangle
#Author: Wesley Chok

rm *.o
rm *.out


echo "Compile rectangle.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o main.o main.cpp

echo  "Assemble perimeter.asm"
nasm -f elf64 -l interview.lis -o interview.o interview.asm

echo "Link the object files using g++"
g++ -m64 -fno-pie -no-pie -o assembly.out main.o interview.o -std=c++17 

echo "Run the program Assignment 1: Perimeter of Rectangle"
./assembly.out

echo "The script will terminate"
