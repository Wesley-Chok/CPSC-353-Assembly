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
;  This serves as the main assembly file for the program. The tasks this assembly file complete are outputting prompts,
;  calling functions in different files (Files such as fill.asm, sum.asm, display.cpp), and returning the sum back
;  to the main.c file.
;This file
;   File name: control.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -o sum.o -l sum.lis sum.asm


;===== Begin code area ================================================================================================
extern printf
extern scanf
extern fill
extern sum 
extern displayArr

array_size equ 100

global _first

section .data
    stringFormat db "%s",0
    numsEnteredPrompt db 10,"Thank you. You entered",10,0
    meanOutputPrompt db "The harmonic mean of these numbers is %1.8lf",10,0
    goodbyePrompt db "The control module will now return the sum to the caller module.",10,0


section .bss
    numArray: resq 100                         ; Array with 100 reserved qwords
section .text

_first:

    ; Back up all registers and set stack pointer to base pointer
    push rbp
    mov  rbp,rsp
    push rdi                                ;Backing up rdi
    push rsi                                ;Backing up rsi
    push rdx                                ;Backing up rdx
    push rcx                                ;Backing up rcx
    push r8                                 ;Backing up r8
    push r9                                 ;Backing up r9
    push r10                                ;Backing up r10
    push r11                                ;Backing up r11
    push r12                                ;Backing up r12
    push r13                                ;Backing up r13
    push r14                                ;Backing up r14
    push r15                                ;Backing up r15
    push rbx                                ;Backing up rbx
    pushf                                   ;Backing up rflags

    push qword -1                           ;Creates an even number of pushes

    ;============= Begin section to initialize registers==========================================================================================================
    mov qword r14, 0                        ;Move register 14 to 0 to store the number of elements in the array
    mov qword r13, 0                        ;Move register 13 to 0 to store the sum of integers in the array
    ;============= End section to initialize registers============================================================================================================


    ;============= Begin section to call fill=====================================================================================================================
    mov qword rdi, numArray
    mov qword rsi, r14
    mov qword rax, 0
    call fill                              ;Calls the global function in fill.asm
    mov r14, rax
    ;============= End section to call fill=======================================================================================================================


    ;============= Begin section to check the user inputs=========================================================================================================
    mov qword rdi, stringFormat
    mov qword rsi, numsEnteredPrompt       ;"The numbers you entered are these:"
    mov qword rax, 0
    call printf
    ;============= End section to check the user inputs===========================================================================================================


    ;============= Begin section to call displayArr===============================================================================================================
    push qword 0
    mov qword rdi, numArray
    mov qword rsi, r14
    mov qword rax, 0
    call displayArr                        ;Calls the function in display.cpp
    pop qword rax
    ;============= End section to call displayArr=================================================================================================================


    ;============= Begin section to call sum======================================================================================================================
    mov qword rdi, numArray
    mov qword rsi, r14
    mov qword rax, 0
    call sum                               ;Calls the global function in sum.asm
    ;============= End section to call sum========================================================================================================================


    ;Displays the sum of the array to the user
    push qword 0
    mov qword rax, 1
    mov qword rdi, meanOutputPrompt        ;"Thank you. You entered %1.8lf"
    call printf
    pop rax


    ;Displays the goodbye prompt to the user
    push qword 0
    mov qword rax, 0
    mov qword rdi, goodbyePrompt          ;"The control module will now return the sum to the caller module."
    call printf
    pop qword rax


    ;Restore the registers that were backed up and defined
    pop rax                                 ;Remove extra push of -1 from stack.
    movsd xmm0, xmm13                       ;Moves the scalar double-precision floating-point value register xmm12 to register xmm0         
    popf                                    ;Restoring rflags              
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
