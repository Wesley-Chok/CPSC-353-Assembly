;****************************************************************************************************************************
;Program name: "King of Assembly".  This program demonstrates passing values from main to assembly file,       *
;calculating arithimetic functions in assembly file and using IEEE 754 conversions.                                         *
;Copyright (C) 2021 Wesley Chok                                                                                             *
;This file is part of the software program "King of Assembly".                                                              *
;King of Assembly is free software: you can redistribute it and/or modify it under the terms of the GNU General             *
;Public License version 3 as published by the Free Software Foundation.                                                     *
;King of Assembly is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the             *
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
;  Program name: King of Assembly
;  Programming languages: One modules in C++ and one modules assembly.
;  Date program began: 2021-April-26
;  Date of last update: 2021-May-12
;  Date of reorganization of comments: 2021-May-12
;  Files in this program: main.cpp, interview.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;Purpose
;  This serves as the main assembly file for the program. The tasks this assembly file complete taking values
;  that were passed from main, calculating arithmetic values and utilizing and converting IEEE 754 values.
;This file
;   File name: control.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Assemble: nasm -f elf64 -l interview.lis -o interview.o interview.asm


;===== Begin code area ================================================================================================

extern printf
extern scanf
global _first


section .data
     welcomePrompt db "Hello %s. I am Ms Fenster. The interview will begin now.",10,0
     salaryPrompt db "Wow!  %5.2lf  That's a lot of cash. Who do you think you are, Chris Sawyer (y or n)?",0
     stringFormat db "%s",0
     programmerPrompt db 10,"Alright.  Now we will work on your electricity",10,0
     resistanceOnePrompt db "Please enter the resistance of circuit #1 in ohms: ",10,0
     resistanceTwoPrompt db "What is the resistance of circuit #2 in ohms: ",10,0
     floatFormat db "%lf",0
     resistanceOutputPrompt db "The total resistance is %lf Ohms.",10,0
     majorPrompt db "Were you a computer science major (y or n)?",0
     exitPrompt db 10,"Thank you.  Please follow the exit signs to the front desk.",10,0


section .bss

section .text

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

     ;============= Begin section to initialize registers========================================================================================================
     push qword 0     
     mov r14, rdi                               ;Holds the name inputted in main.cpp
     movsd xmm13, xmm0                          ;Holds the salary inputted in main.cpp
     ;============= End section to initialize registers==========================================================================================================
     
     ;Displays welcome prompt to the user
     push qword 0
     mov rax, 0
     mov rdi, welcomePrompt                     ;"Hello %s. I am Ms Fenster. The interview will begin now."
     mov rsi, r15
     call printf
     pop rax

     ;============= Begin section to ask if user is Chris Sawyer=================================================================================================
     ;Displays salary prompt to the user
     push qword 99
     mov rax, 1
     mov rdi, salaryPrompt                      ;"Wow!  %5.3lf  That's a lot of cash. Who do you think you are, Chris Sawyer (y or n)?"
     movsd xmm0, xmm13
     call printf
     pop rax

     push qword 0
     mov rdi, stringFormat                      ;"%s"
     mov rsi, rsp
     call scanf
     pop rax

     mov r15, 'y'                               ;Move 'y' into register r15
     cmp rax, r15                               ;Compare register rax with r15
     je chris_sawyer                            ;If register rax is y and equal to r15, jump to chris_sawyer

     mov r15, 'n'                               ;Move 'n' into register r15
     cmp rax, r15                               ;Compare register rax with r15
     je resistance                              ;If register rax is n and equal to r15, jump to resistance
     ;============= End section to ask if user is Chris Sawyer==================================================================================================

     
     ;============= Begin section for resistance jump===========================================================================================================
     resistance:
     ;Displays programmer electricity prompt to the user
     push qword 0
     mov rax, 0
     mov rdi, programmerPrompt                  ;"Alright.  Now we will work on your electricity"
     call printf
     pop rax

     ;Displays the first resistance prompt to the user
     push qword 99
     mov rax, 0
     mov rdi, resistanceOnePrompt               ;"Please enter the resistance of circuit #1 in ohms: "
     call printf
     pop rax

     ;Storing user input for the first resistance prompt
     push qword -1
     mov rax, 0
     mov rdi, floatFormat                       ;"%lf"
     mov rsi, rsp
     call scanf
     movsd xmm12, [rsp]
     pop rax

     push qword 99
     mov rax, 0
     mov rdi, resistanceTwoPrompt               ;"What is the resistance of circuit #2 in ohms: "
     call printf
     pop rax

     ;Storing user input for the second resistance prompt
     push qword -1
     mov rax, 0
     mov rdi, floatFormat                       ;"%lf"
     mov rsi, rsp
     call scanf
     movsd xmm13, [rsp]
     pop rax

     push qword 0
     mov r9, 1                                  ;Move 1 into register r9
     cvtsi2sd xmm9, r9                          ;Convert r9 into a scalar double precision floating-point
     mov r8, 1                                  ;Move 1 into register r8
     cvtsi2sd xmm8, r8                          ;Convert r8 into a scalar double precision floating-point
     mov r15, 1                                 ;Move 1 into register r15
     cvtsi2sd xmm15, r15                        ;Convert r15 into a scalar double precision floating-point

     divsd xmm9, xmm12                          ;Divide xmm9 over xmm12
     divsd xmm8, xmm13                          ;Divide xmm8 over xmm12

     addsd xmm8, xmm9                           ;Add xmm8 over xmm9

     divsd xmm15, xmm8                          ;Divide xmm15 over xmm8 to get the resistance formula answer

     ;Displays the output of the resistance formula
     mov rax, 1
     mov rdi, resistanceOutputPrompt
     movsd xmm0, xmm15
     call printf
     pop rax

     ;Displays whether the user is a computer science major or not prompt to the user
     push qword 0
     mov rax, 0
     mov rdi, majorPrompt                       ;"Were you a computer science major (y or n)?"
     call printf
     pop rax

     push qword 0
     mov rdi, stringFormat                      ;"%s"
     mov rsi, rsp
     call scanf
     pop rax

     mov r15, 'y'                               ;Move 'y' into register r15
     cmp rax, r15                               ;Compare register rax with r15
     je programmer                              ;If register rax is y and equal to r15, jump to programmer

     mov r13, 'n'                               ;Move 'n' into register r13
     cmp rax, r13                               ;Compare register rax with r13
     je noMajor                                 ;If register rax is n and equal to r13, jump to noMajor
     ;============= End section for resistance jump============================================================================================================


     ;============= Begin section for programmer jump==========================================================================================================
     programmer:
     ;Display exit prompt to the user
     push qword 0
     mov rax, 0
     mov rdi, exitPrompt                        ;"Thank you.  Please follow the exit signs to the front desk."
     call printf
     pop rax

     mov rax, 0x40F57C0E147AE148                ;IEE-754 floating-point conversion of 88000.18
     movq xmm14, rax                            ;Move quadword rax to register xmm14
     jmp exit                                   ;Jump to exit
     ;============= End section for programmer jump============================================================================================================
     

     ;============= Begin section for noMajor jump=============================================================================================================
     noMajor:
     ;Display exit prompt to the user
     push qword 0
     mov rax, 0
     mov rdi, exitPrompt                        ;"Thank you.  Please follow the exit signs to the front desk."
     call printf
     pop rax

     mov rax, 0x4092C07AE147AE14                ;IEE-754 floating-point conversion of 1200.12
     movq xmm14, rax                            ;Move quadword rax to register xmm14
     jmp exit                                   ;Jump to exit
     ;============= End section for noMajor jump===============================================================================================================
     

     ;============= Begin section for chris_sawyer jump========================================================================================================
     chris_sawyer:
     ;Display exit prompt to the user
     push qword 0
     mov rax, 0
     mov rdi, exitPrompt
     call printf
     pop rax

     mov rax, 0x412E848000000000                ;IEE-754 floating-point conversion of 1000000
     movq xmm14, rax                            ;Move quadword rax to register xmm14
     jmp exit                                   ;Jump to exit
     ;============= End section for chris_sawyer jump==========================================================================================================

     
     ;============= Begin section for end jump=================================================================================================================
     exit:
     movsd xmm0, xmm14                          ;Move register xmm14 to register xmm0 to return the value back to main
     pop rax

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
     ;============= End section for end jump===================================================================================================================
