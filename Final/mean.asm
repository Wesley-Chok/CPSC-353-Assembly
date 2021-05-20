;****************************************************************************************************************************
;Program name: "Assignment 3 Sum of Array".  This program demonstrates sum of float numbers in an array through calling     *
;functions from other files, adding and arrays. The arithmetic function that was used was adding (addsd)                    *
;Copyright (C) 2021 Wesley Chok                                                                            
;This file is part of the software program "Sum of Array".                                                        *
;Sum of Array is free software: you can redistribute it and/or modify it under the terms of the GNU General       *
;Public License version 3 as published by the Free Software Foundation.                                                     *
;Sum of Array is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the       *
;implied                                                                                                                    *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************




;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Wesley Chok
;  Author email: chokwj@csu.fullerton.edu
;
;Program information
;  Program name: Assignment 3 Sum of Array
;  Programming languages: One modules in C, one modules in C++ and three modules in assembly
;  Date program began: 2021-Mar-17
;  Date of last update: 2020-Mar-19
;  Date of reorganization of comments: 2021-Mar-20
;  Files in this program: main.c, control.asm, sum.asm, display.cpp and fill.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;Purpose
;  Calculates the sum of the array, which was calculated in fill.asm and returned to control.asm, through looping
;  Once the loop ends, it moves the double scalar floating point that holds the sum to a double scalar floating point located at 0
;
;This file
;   File name: sum.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Parameter passed in: rdi (numArray), rsi (r14) and rax (0)
;   Parameter passed out: xmm0 (moved xmm14 into this to return the sum back to control.asm)
;   Assemble: nasm -f elf64 -o sum.o -l sum.lis sum.asm
;===== Begin code area ================================================================================================

extern printf
global sum 
section .data
section .bss
section .text

sum:
    push rbp
    mov rbp,rsp
    push rdi                                ;Backing up rdi
    push rsi                                ;Backing up rsi
    push rdx                                ;Backing up rdx
    push rcx                                ;Backing up rcx
    push r8                                 ;Backing up r8
    push r9                                 ;Backing up r9
    push r10                                ;Backing up r10s
    push r11                                ;Backing up r11
    push r12                                ;Backing up r12
    push r13                                ;Backing up r13
    push r14                                ;Backing up r14
    push r15                                ;Backing up r15
    push rbx                                ;Backing up rbx

    push qword -1                           ;Creates an even number of pushes

    mov r15, rdi                      ;Move register 15 to rdi to save address of array.
    mov r14, rsi                      ;Move register 14 into rsi for max number of elements
    mov r13, 0                        ;Move register 13 to 0 for sum the elements in the array
    cvtsi2sd xmm14, r13               ;Convert register 13 to a double scalar floating point value
    mov r12, 0                        ;Move register 12 to 0 for the counter
    

    ;============= Begin section for start_loop======================================================================================================================================
    start_loop:
    ;Compares the counter and number of elements in the array. If counter is greater than or equal to number of elements in the array
    ;then it will jump to end_loop
    cmp r12, r14
    jge end_loop

    mov r11, 1
    cvtsi2sd xmm15, r11

    divsd xmm15, [r15 + 8 * r12]

    addsd xmm14, xmm15

    
    ;Adds the current element in the array and stores it into the sum (xmm14). Iterates the counter (r12) by 1
    ; addsd xmm14, [r15 + 8 * r12]
    inc r12

    ;Loop
    jmp start_loop
    ;============= End section for start_loop========================================================================================================================================


    ;============= Begin section for end_loop========================================================================================================================================
    end_loop:

    cvtsi2sd xmm13, r12
    divsd xmm13, xmm14

    pop rax                                 ;Remove extra push of -1 from stack.
    movsd xmm0, xmm13                       ;Moves the scalar double-precision floating-point value register xmm14 to register xmm0
    pop rbx                                 ;Restoring rbx                                    
    pop r15                                 ;Restoring r15
    pop r14                                 ;Restoring r14
    pop r13                                 ;Restoring r13    
    pop r12                                 ;Restoring r12                   
    pop r11                                 ;Restoring r11             
    pop r10                                 ;Restoring r10                
    pop r9                                  ;Restoring r9                 
    pop r8                                  ;Restoring r8           
    pop rcx                                 ;Restoring rcx            
    pop rdx                                 ;Restoring rdx        
    pop rsi                                 ;Restoring rsi              
    pop rdi                                 ;Restoring rdi        
    pop rbp                                 ;Restoring rbp  


    ret
    ;============= End section for end_loop===========================================================================================================================================
