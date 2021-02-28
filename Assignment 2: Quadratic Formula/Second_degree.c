//****************************************************************************************************************************
//Program name: "Assignment 2 Quadratic Formula".  This program demonstrates the construction of the quadratic formula       *
//and determining if the formula contains one, two or no root(s). Jump instructions (ja, je, jmp, jb), float conversions     *
//(atof and atolong) and arithmetic functions (mulsd, addsd, sqrtsd, divdsd) were the more notable functions utilized.       *
//Quadratic Formula is free software: you can redistribute it and/or modify it under the terms of the GNU General            *
//Public License version 3 as published by the Free Software Foundation.                                                     *
//Quadratic Formula is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the            *
//implied                                                                                                                    *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************




//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: Wesley Chok
//  Author email: chokwj@csu.fullerton.edu
//
//Program information
//  Program name: Assignment 2 Quadratic Formula
//  Programming languages: Three modules in C++, one module in X86 and one module in C
//  Date program began: 2021-Feb-22
//  Date of last update: 2021-Feb-28
//  Date of reorganization of comments: 2021-Feb-28
//  Files in this program: Second_degree.c, Quadratic.asm, isfloat.cpp, Quad_library, isdigit.cpp
//  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
//
//This file
//   File name: Second_degree.c
//   Language: X86 with Intel syntax.
//   Max page width: 132 columns
//   Assemble: gcc -c -Wall -m64 -no-pie -o Second_degree.o Second_degree.c -std=c11


//===== Begin code area ======================================================================================================================


#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h> 
#include <stdbool.h>

extern float _first();
extern bool isfloat();

int main (int argc, char* argv[])
{
    float result = 0.0;
    printf("Welcome to Root Calculator.\n");
    printf("Programmed by Wesley Chok, Professional Programmer.\n");
    result = _first();
    printf("The main driver received %lf and has decided to keep it.\n", result);
    printf("Now 0.0 will be returned to the operating system. Bye.\n");
}
