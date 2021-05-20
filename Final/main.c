// ****************************************************************************************************************************
// Program name: "Assignment 3 Sum of Array".  This program demonstrates sum of float numbers in an array through calling     *
// functions from other files, adding and arrays. The arithmetic function that was used was adding (addsd)                    *
// Copyright (C) 2021 Wesley Chok                                                                            
// This file is part of the software program "Sum of Array".                                                        *
// Sum of Array is free software: you can redistribute it and/or modify it under the terms of the GNU General       *
// Public License version 3 as published by the Free Software Foundation.                                                     *
// Sum of Array is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the       *
// implied                                                                                                                    *
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
// A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
// ****************************************************************************************************************************




// ========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
// 
// Author information
//   Author name: Wesley Chok
//   Author email: chokwj@csu.fullerton.edu
// 
// Program information
//   Program name: Assignment 3 Sum of Array
//   Programming languages: One modules in C, one modules in C++ and three modules in assembly
//   Date program began: 2021-Mar-17
//   Date of last update: 2020-Mar-19
//   Date of reorganization of comments: 2021-Mar-20
//   Files in this program: main.c, control.asm, sum.asm, display.cpp and fill.asm
//   Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
// 
// Purpose
//   This serves as the main C file for this program. The tasks this C file complete are welcoming
//   the user, calling the function in control.asm and outputting the sum that's returned from
//   control.asm.
// This file
//    File name: main.c
//    Language: X86 with Intel syntax.
//    Max page width: 132 columns
//    Assemble: gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11


// ;===== Begin code area ================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h> 
#include <stdbool.h>

extern double _first();

int main (int argc, char* argv[])
{double result = 0.0;
    printf("This 240-07 programming final by Wesley Chok.\n");
    result = _first();
    printf("The main has received this number %5.15lf and will keept it.\n", result);
    printf("A 0 will be returned to the operating system.\n");
    printf("Have a great next semester. Bye.\n");
}
