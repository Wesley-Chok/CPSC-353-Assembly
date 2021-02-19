#Wesley Chok
#CPSC240-1 Test 1

#!/bin/bash

#Program: Perimeter of Rectangle
#Author: Wesley Chok

rm *.o
rm *.out

echo "Assembly Resistance.asm"
nasm -f elf64 -l Resistance.lis -o Resistance.o Resistance.asm

echo "Compile Electricity.cpp"
gcc -c -Wall -m64 -no-pie -o Electricity.o Electricity.cpp -std=c++17

echo "Link the object files using gcc"
gcc -m64 -no-pie -o resultResistance.out -std=c++17 Resistance.o Electricity.o

echo "Run the program Take-home Test #1: Resistance"
./resultResistance.out

echo "The script will terminate"