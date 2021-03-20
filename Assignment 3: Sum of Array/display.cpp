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
//   Displays the content of the array where the elements are created by the user input. Once it displays the elements,
//   it returns back to control.asm
// This file
//    File name: display.cpp
//    Language: X86 with Intel syntax.
//    Max page width: 132 columns
//    Assemble: g++ -c -m64 -Wall -fno-pie -no-pie -o display.o display.cpp -std=c++17


// ;===== Begin code area ================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h> 

#include <stdio.h>

extern "C" void displayArr(double array[], long index);

void displayArr(double array[], long index)
{
    for (long i = 0; i < index; ++i)
    {
        printf("%1.3f", array[i]);
        printf("%s"," ");
        printf("\n");
    }
}
