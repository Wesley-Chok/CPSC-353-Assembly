;****************************************************************************************************************************
;Program name: "Assignment 2 Quadratic Formula".  This program demonstrates the construction of the quadratic formula       *
;and determining if the formula contains one, two or no root(s). Jump instructions (ja, je, jmp, jb), float conversions     *
;(atof and atolong) and arithmetic functions (mulsd, addsd, sqrtsd, divdsd) were the more notable functions utilized.       *
;Quadratic Formula is free software: you can redistribute it and/or modify it under the terms of the GNU General            *
;Public License version 3 as published by the Free Software Foundation.                                                     *
;Quadratic Formula is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the            *
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
;  Program name: Assignment 2 Quadratic Formula
;  Programming languages: Three modules in C++, one module in X86 and one module in C
;  Date program began: 2021-Feb-22
;  Date of last update: 2021-Feb-28
;  Date of reorganization of comments: 2021-Feb-28
;  Files in this program: Second_degree.c, Quadratic.asm, isfloat.cpp, Quad_library, isdigit.cpp
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;This file
;   File name: Quadratic.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l Quadratic.lis -o Quadratic.o Quadratic.asm


;===== Begin code area ========================================================================================================================================================
extern printf
extern scanf
extern atof
extern atolong
extern isfloat
extern Second_degree
extern show_no_root
extern show_one_root
extern show_two_root

global _first

section .data
    welcome db "This program will find the roots of any quadratic equation.",10,0
    inputCoefficientPrompt db "Please enter the three floating point coefficients of a quadratic equation in the order a,b,c separated by the end of line character.",10,0
    string_format db "%s",0
    three_string_format db "%s%s%s", 0
    invalidPrompt db "This input is not valid. You may run this program again.",10,0
    invalidZeroPrompt db "This is not a quadratic equation. You may run this program again",10,0
    equationPrompt db "Thank you. The equation is %5.3lfx^2 + %5.3lfx + %5.3lf = 0.0",10,0
    goodbye db "One of these roots will be returned to the caller function",10,0
    validPrompt db "You arrived at valid sir!",10,0
section .bss

section .text

_first
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

    push qword 0

    ;Displays the welcome message prompt to the user
    push qword 0                       ;Used to make space on the stack to avoid overwritting
    mov rax, 0                         ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, welcome                   ;"This program will find the roots of any quadratic equation."
    call printf
    pop rax

    ;============= Begin section to input the coefficients=======================================================================================================================
    push qword 99
    mov rax, 0
    mov rdi, inputCoefficientPrompt     ;"Please enter the three floating point coefficients of a quadratic equation in the order a,b,c separated by the end of line character."
    call printf
    pop rax

    push qword -1
    push qword -2
    push qword -3
    mov rax, 0
    mov rdi, three_string_format         ;"%s%s%s"
    sub rsp, 1024
    mov rsi, rsp
    mov rdx, rsp
    add rdx, 8
    mov rcx, rsp
    add rcx, 16
    movsd xmm5, [rsp]
    movsd xmm6, [rsp+8]
    movsd xmm7, [rsp+16]
    call scanf
    ;============= End section to input the coefficients==========================================================================================================================


    ;============= Begin section to check inputs and convert to float=============================================================================================================
    ;check the user input
    mov rax, 0
    mov rdi, rsp
    call isfloat                        ;Call isfloat()
    cmp rax, 0                          ;Compare register rax to 0
    je invalid                          ;If register rax equal to 0 jump to invalid

    ;float conversion
    mov rax,0
    mov rdi, rsp
    call atof                           ;Call atof() to convert string to float
    movsd xmm5, xmm0                    ;Move float conversion output to xmm5

    mov r11, 0                          ;set r11 equal to 0               
    cvtsi2sd xmm11, r11                 ;convert r11 into a scalar double precision floating-point
    ucomisd xmm5, xmm11                 ;Compare a and 0
    je invalidZero                      ;If a is equal to 0 then jump to invalidZero

    ;check the user input
    mov rax, 0
    mov rdi, rsp
    add rdi, 8                          ;Increment the rdi register to 8 to access the b value
    call isfloat                        ;Call isfloat()
    cmp rax, 0                          ;Compare register rax to 0
    je invalid                          ;If register rax equal to 0 jump to invalid

    ;float conversion
    mov rax,0
    mov rdi, rsp
    add rdi, 8                          ;Increment the rdi register to 8 to access the b value
    call atof                           ;Call atof() to convert string to float
    movsd xmm6, xmm0                    ;Move float conversion output to xmm6

    ;check the user input
    mov rax, 0
    mov rdi, rsp    
    add rdi, 16                         ;Increment the rdi register to 16 to access the c value
    call isfloat                        ;Call isfloat()
    cmp rax, 0                          ;Compare register rax to 0
    je invalid                          ;If register rax equal to 0 jump to invalid

    ;float conversion
    mov rax,0
    mov rdi, rsp
    add rdi, 16                         ;Increment the rdi register to 16 to access the c value
    call atof                           ;Call atof() to convert string to float
    movsd xmm7, xmm0                    ;Move float conversion output to xmm7


    jmp valid                           ;Jump to valid
    ;============= End section to check inputs and convert to float==============================================================================================================


;============= Begin section for invalid jump====================================================================================================================================
invalid:
    mov rax, 1
    mov rdi, invalidPrompt              ;"This input is not valid, try again"
    call printf

    jmp endInvalid                      ;Jump to endInvalid to end the code
;============= End section for invalid jump======================================================================================================================================


;============= Begin section for invalid zero jump=================================================================================================================================
invalidZero:
    mov rax, 1
    mov rdi, invalidZeroPrompt          ;"This is not a quadratic equation. You may run this program again"
    call printf

    jmp endInvalid
;============= End section for invalid zero jump=================================================================================================================================


;============= Begin section for valid jump======================================================================================================================================
valid:
    sub rsp, 1024
    add rsp, 1024
    pop rax
    jmp equationOutput                 ;Jump to equationOutput to output the quadratic equation
;============= Begin section for valid jump======================================================================================================================================


;============= Begin section for equationOutput jump=============================================================================================================================
equationOutput:
    push qword 99
    mov rax, 3                         ;To input the 3 coefficients
    mov rdi, equationPrompt            ;"Thank you. The equation is %5.3lf x^2 + %5.3lf x + %5.3lf = 0.0"
    movsd xmm0, xmm5                   ;To output our a coefficient
    movsd xmm1, xmm6                   ;To output our b coefficient
    movsd xmm2, xmm7                   ;To otuptu our c coefficient
    call printf
    pop rax
    jmp calculations                   ;Jump to calculations to calculate the root
;============= End section for equationOutput jump===============================================================================================================================


;============= Begin section for calculations jump===============================================================================================================================
calculations:
    mov r10, 4                         ;set r10 equal to 4
    cvtsi2sd xmm10, r10                ;convert r10 into a scalar double-precision floating-point
    ;mov r11, 0                         ;set r11 equal to 0
    ;cvtsi2sd xmm11, r11                ;convert r11 into a scalar double-precision floating-point
    movsd xmm3, xmm6                   ;Store b in register xmm3
    mulsd xmm6, xmm6                   ;multiply b*b to simulate b^2
    movsd xmm8, xmm5                   ;Backup copy for a
    mulsd xmm5, xmm7                   ;multiply a and c
    mulsd xmm5, xmm10                  ;multiply a*c and 4
    subsd xmm6, xmm5                   ;subtract the output of b*b and output of 4ac
    ucomisd xmm6, xmm11                ;compare xmm registers
    ja twoRoot                         ;If xmm6 is above 0 jump to twoRoot
    je oneRoot                         ;If xmm6 is equal to 0 jump to oneRoot
    jb noRoot                          ;If xmm6 is unassigned to 0 jump to noRoot
;============= End section for calculations jump==================================================================================================================================


;============= Begin section for twoRoot jump=====================================================================================================================================
twoRoot:
    push qword 0
    mov r9, -1                         ;set r9 equal to -1
    cvtsi2sd xmm9, r9                  ;convert r9 into a scalar double-precision floating-point
    mov r8, 2                          ;set r8 equal to 2
    cvtsi2sd xmm4, r8                  ;convert r8 into a scalar double-precision floating-point
    sqrtsd xmm12, xmm6                 ;square root the output of b^2-4ac and store in xmm12
    sqrtsd xmm13, xmm6                 ;square root the output of b^2-4ac and store in xmm13
    mulsd xmm9, xmm3                   ;multiply b and -1
    movsd xmm15, xmm9
    addsd xmm9, xmm12                  ;add b * -1 and the result of sqrt(b^2-4ac)
    subsd xmm15, xmm13                 ;subtract b * -1 and the results of sqrt(b^2-4ac)
    mulsd xmm4, xmm8                   ;multiply 2 and a
    movsd xmm14, xmm4                  ;backup copy for 2*a
    divsd xmm4, xmm9                   ;divide (b * -1 + sqrt(b^2-4ac)) over 2 * a
    divsd xmm15, xmm14                 ;divide (b * -1 - sqrt(b^2-4ac)) over 2 * a
    movsd xmm0, xmm4                   
    movsd xmm1, xmm15

    mov rax, 2
    call show_two_root                 ;call show_two_root to output our 2 roots
    pop rax
    pop rax

    jmp endOfProgram                   ;Jump to endOfProgram to end the program
;============= End section for twoRoot jump========================================================================================================================================


;============= Begin section for oneRoot jump======================================================================================================================================
oneRoot:
    push qword 0                  
    mov r9, -1                         ;set r9 equal to -1
    cvtsi2sd xmm9, r9                  ;convert r9 into a scalar double-precision floating-point
    mov r8, 2                          ;set r8 equal to 2
    cvtsi2sd xmm4, r8                  ;convert r8 into a scalar double-precision floating-point

    mulsd xmm4, xmm8                   ;multiply 2 and a
    mulsd xmm9, xmm3                   ;multiply b and -1
    divsd xmm9, xmm4                   ;divide b*-1 over 2*a
    movsd xmm4, xmm9                   ;move register xmm9 to xmm4 for consistency
    movsd xmm0, xmm4                    

    mov rax,1
    call show_one_root                 ;call show_one_root to output 1 root
    pop rax

    jmp endOfProgram                   ;Jump to endOfProgram to end the program
;============= End section for oneRoot jump=========================================================================================================================================


;============= Begin section for noRoot jump========================================================================================================================================
noRoot:
    mov rax,0
    call show_no_root                  ;Call show_no_root to output no root(s)
;============= End section for noRoot jump===========================================================================================================================================


;============= Begin section for endInvalid jump=====================================================================================================================================
endInvalid: 
    mov r8, 0                          ;set r8 equal to 0
    cvtsi2sd xmm8, r8                  ;conver r9 into a scalar double-precision floating-point

    movsd xmm0, xmm8
;============= End section for endInvalid jump=======================================================================================================================================


;============= Begin section for endOfProgram jump===================================================================================================================================
endOfProgram:
    mov rax, 1
    mov rdi, goodbye                   ;"One of these roots will be returned to the caller function"
    call printf

    pop rax

    movsd xmm0, xmm4
    add rsp, 1024
;============= End section for endOfProgram jump======================================================================================================================================
    

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
