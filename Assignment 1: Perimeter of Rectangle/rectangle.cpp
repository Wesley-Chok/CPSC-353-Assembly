//****************************************************************************************************************************
//Program name: "Assignment 1 Perimeter of Rectangle".  This program demonstrates the perimeter of the rectangle through     *                                                                        
//input variables and arithmetic functions. The arithmetic functions primarily used were addition (addsd), multiplication    *
//(mulsd) and division (divsd) through registers Copyright (C) 2021 Wesley Chok                                              *                                                                             
//This file is part of the software program "Perimeter of Rectangle".                                                        *
//Perimeter of Rectangle is free software: you can redistribute it and/or modify it under the terms of the GNU General       *
//Public License version 3 as published by the Free Software Foundation.                                                     *
//Perimeter of Rectangle is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the       *
//implied                                                                                                                    *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************


//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Wesley Chok
//  Author email: wchok@csu.fullerton.edu
//
//Program information
//  Program name: Assignment 1 Perimeter of Rectangle
//  Programming languages: One modules in C++ and one module in X86
//  Date program began: 20120-Feb-16
//  Date of last update: 2020-Feb-16
//  Date of reorganization of comments: 2020-Feb-16
//  Files in this program: rectangle.cpp, perimeter.asm
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//Purpose
//  Show how to input and output floating point (64-bit) numbers.
//
//This file
//   File name: manage-floats.c
//   Language: C++
//   Max page width: 132 columns
//   Compile: g++ -c -m64 -Wall -fno-pie -no-pie -o rectangle.o rectangle.cpp
//   Link: g++ -m64 -fno-pie -no-pie -o perimOfRectangle.out rectangle.o perimeter.o -std=c++17 
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h> 
extern "C" double _first();
//
int main()
{
    double answer = 0.0;
    answer = _first();
    printf("The main functio received this number %8.5lf and has decided to keep it.\n",answer);
    printf("A 0 will be returned to the operating system.\n");
    printf("Have a nice day.");
    return 0;
}
