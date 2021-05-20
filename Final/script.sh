#!/bin/bash

#Program: Sum of an Array
#Author: Wesley Chok
rm *.o
rm *.out

echo "Assemble fill.asm"
nasm -f elf64 -o fill.o -l fill.lis fill.asm

echo "Assemble sum.asm"
nasm -f elf64 -o mean.o -l mean.lis mean.asm

echo "Assemble control.asm"
nasm -f elf64 -l harmonic.lis -o harmonic.o harmonic.asm

echo "Compile display.cpp using g++"
g++ -c -m64 -Wall -fno-pie -no-pie -o display.o display.cpp -std=c++17

echo "Compile isfloat.cpp using g++"
g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17

echo "Compile main.c using gcc"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "Link the object files using gcc"
g++ -m64 -no-pie -o sumArray.out fill.o mean.o harmonic.o display.o isfloat.o main.o -std=c11

echo "Run the program Assignment 3: Sum of an Array"
./sumArray.out

echo "The script will terminate"
