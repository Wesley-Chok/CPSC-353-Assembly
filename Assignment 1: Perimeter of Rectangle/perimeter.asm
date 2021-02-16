;****************************************************************************************************************************
;Program name: "Assignment 1 Perimeter of Rectangle".  This program demonstrates the perimeter of the rectangle through     *                                                                        
;input variables and arithmetic functions. The arithmetic functions primarily used were addition (addsd), multiplication    *
;(mulsd) and division (divsd) through registers Copyright (C) 2021 Wesley Chok                                              *                                                                             
;This file is part of the software program "Perimeter of Rectangle".                                                        *
;Perimeter of Rectangle is free software: you can redistribute it and/or modify it under the terms of the GNU General       *
;Public License version 3 as published by the Free Software Foundation.                                                     *
;Perimeter of Rectangle is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the       *
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
;  Program name: Assignment 1 Perimeter of Rectangle
;  Programming languages: One modules in C++ and one module in X86
;  Date program began: 2020-Feb-16
;  Date of last update: 2020-Feb-16
;  Date of reorganization of comments: 2020-Feb-16
;  Files in this program: rectangle.cpp, perimeter.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: perimeter.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm


;===== Begin code area ================================================================================================
extern printf
extern scanf
global _first

segment .data
    ;Message prompts utilizing defined bytes (db) to define raw bytes of data
    ;to insert into the code 
    welcome db "Welcome to an friendly assembly program by Wesley Chok",10,0
    description db "This program will compute the perimeter and the average side length of a rectangle",10,0
    inputHeightPrompt db "Enter the height",0
    inputWidthPrompt db "Enter the width",0
    outputPerimPrompt db "The perimeter is %5.3lf",10,0
    outputAvgPrompt db "The length of the average side is %5.3lf",10,0
    float_format db "%lf",0
    goodbyePrompt db "I hope you enjoyed your rectangle",10,0

    

segment .bss

segment .text

_first:
    ;Back up the registers necessary to define them.
    push rbp
    mov  rbp,rsp
    push rdi                                                    ;Backing up rdi
    push rsi                                                    ;Backing up rsi
    push rdx                                                    ;Backing up rdx
    push rcx                                                    ;Backing up rcx
    push r8                                                     ;Backing up r8
    push r9                                                     ;Backing up r9
    push r10                                                    ;Backing up r10
    push r11                                                    ;Backing up r11
    push r12                                                    ;Backing up r12
    push r13                                                    ;Backing up r13
    push r14                                                    ;Backing up r14
    push r15                                                    ;Backing up r15
    push rbx                                                    ;Backing up rbx
    pushf                                                       ;Backing up rflags

    ;Displays the welcome message prompt to the user
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov rax, 0                      ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, welcome                ;"Welcome to an friendly assembly program by Wesley Chok"
    call printf

    ;Display the decription message prompt to the user
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov rax, 0                      ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, description            ;"This program will compute the perimeter and the average side length of a rectangle"
    call printf
    pop rax                         ;The push in the scanf block will be reversed

    ;============= Begin section to input the height========================================================
    ;Display height message prompt to the user
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov rax, 0                      ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, inputHeightPrompt      ;"Enter the height"
    call printf
    pop rax                         ;The push in the scanf block will be reversed

    ;Begin to call scanf
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov rax, 0                      ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, float_format           ;Moves data into the memory address
    mov rsi, rsp                    ;Moves data into the stack pointer and points to first quadword on the stack
    call scanf
    movsd xmm11, [rsp]              ;Moves doubleword at advanced vectir extension register 11 to the stack pointer

    pop rax                         ;The push in the scanf block will be reversed
    ;============= End section to input the height========================================================


    ;============= Begin section to input the width========================================================
    ;Display width message prompt to the user
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov rax, 0                      ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, inputWidthPrompt       ;"Enter the width"
    call printf
    pop rax                         ;The push in the scanf block will be reversed

    ;Begin to call scanf
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov rax, 0                      ;Moves data as standard input so printf uses no data as it is rax
    mov rdi, float_format           ;Moves data into the memory address
    mov rsi, rsp                    ;Moves data into the stack pointer and points to first quadword on the stack
    call scanf
    movsd xmm10, [rsp]              ;Moves doubleword at advanced vector extension register 11 to the stack pointer

    pop rax                         ;The push in the scanf block will be reversed
    ;============= End section to input the width========================================================


    ;============= Begin section to calculate the perimeter of the rectangle========================================================

    ;Calculate the perimeter of the rectangle
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov r9, 2                       ;Moves register 9 to be defined as the numerical value 2
    cvtsi2sd xmm9, r9               ;Converts doubleword integer r9 as a scalar double-precision floating-point value stored in register xmm9
    movsd xmm12, xmm11              ;Moves the scalar double-precision floating-point value register xmm11 into register xmm12
    addsd xmm12, xmm10              ;Adds the scalar double-precision floating-point value register xmm10 with register xmm12
    mulsd xmm12, xmm9               ;Multiplies the scalar double-precision floating-point value register xmm9 with register xmm12

    ;Display output perimeter message to the user
    mov rax, 1                      ;Moves data as standard output and printf uses no data as it is rax
    mov rdi, outputPerimPrompt      ;"The perimeter is %5.3lf"
    movsd xmm0, xmm12               ;Moves the scalar double-precision floating-point value register xmm12 to register xmm0
    call printf  

    pop rax                         ;The push in the scanf block will be reversed
    ;============= End section to calculate the perimeter of the rectangle========================================================


    ;============= Begin section to calculate the length of average side========================================================
    ;Calculate the length of average side
    push qword 0                    ;Used to make space on the stack to avoid overwritting
    mov r13, 4                      ;Moves register 9 to be defined as the numerical value 4
    cvtsi2sd xmm13, r13             ;Converts doubleword integer r13 as a scalar double-precision floating-point value stored in register xmm13
    movsd xmm0, xmm12               ;Moves the scalar double-precision floating-point value register xmm12 into register xmm0
    divsd xmm0, xmm13               ;Divides the scalar double-precision floating-point value register xmm13 with register xmm0
    movsd xmm14, xmm0               ;Moves the scalar double-precision floating-point value register xmm0 to register xmm14

    ;Display output for length of average side
    mov rax, 1                      ;Moves data as standard output and printf uses no data as it is rax
    mov rdi, outputAvgPrompt        ;"The length of the average side is %5.3lf"
    movsd xmm0, xmm14               ;Moves the scalar double-precision floating-point value register xmm14 into register xmm0
    call printf

    pop rax                         ;The push in the scanf block will be reversed
    ;============= Begin section to calculate the length of average side========================================================
    

    ;============= Begin section to exit assembly program========================================================
    ;Display goodbye prompt to user
    mov rax, 0                      ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, goodbyePrompt          ;"I hope you enjoyed your rectangle"
    call printf

    pop rax                         ;The push in the scanf block will be reversed
    
    movsd xmm0, xmm12               ;Moves the scalar double-precision floating-point value register xmm12 to register xmm0
    ;============= End section to exit assembly program========================================================

    ;Restore the registers that were backed up and defined
    popf                                                        ;Restoring rflags
    pop rbx                                                     ;Restoring rbx
    pop r15                                                     ;Restoring r15
    pop r14                                                     ;Restoring r14
    pop r13                                                     ;Restoring r13
    pop r12                                                     ;Restoring r12
    pop r11                                                     ;Restoring r11
    pop r10                                                     ;Restoring r10
    pop r9                                                      ;Restoring r9
    pop r8                                                      ;Restoring r8
    pop rcx                                                     ;Restoring rcx
    pop rdx                                                     ;Restoring rdx
    pop rsi                                                     ;Restoring rsi
    pop rdi                                                     ;Restoring rdi
    pop rbp                                                     ;Restoring rbp

    ret
