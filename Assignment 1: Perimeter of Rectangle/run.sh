#!/bin/bash

#Program: Perimeter of Rectangle
#Author: Wesley Chok

rm *.o
rm *.out


echo "Compile rectangle.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o rectangle.o rectangle.cpp

echo  "Assemble perimeter.asm"
nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

echo "Link the object files using g++"
g++ -m64 -fno-pie -no-pie -o perimOfRectangle.out rectangle.o perimeter.o -std=c++17 

echo "Run the program Assignment 1: Perimeter of Rectangle"
./perimOfRectangle.out

echo "The script will terminate"