;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Wesley Chok
;  Author email: chokwj@csu.fullerton.edu
;
;Program information
;  Program name: Final
;  Programming languages: One modules in C, one modules in C++ and three modules in assembly
;  Date program began: 2021-Mar-17
;  Date of last update: 2020-Mar-19
;  Date of reorganization of comments: 2021-Mar-20
;  Files in this program: main.c, harmonic.asm, mean.asm, display.cpp and fill.asm
;  Status: Finished.  The program was tested extensively with no errors in Xubuntu19.04.
;
;Purpose
;  Creates an array through looping and asking for user input. Once the loop ends,
;  it returned back to control.asm
;
;This file
;   File name: fill.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;   Parameter passed in: rdi (numArray), rsi (r14) and rax (0)
;   Parameter passed out: rax (r13)
;   Assemble: nasm -f elf64 -o fill.o -l fill.lis fill.asm
;===== Begin code area ================================================================================================

extern printf
extern scanf
extern atolong
extern atof
extern isfloat

global fill

section .data
    instructionPrompt db "Enter float numbers separated by white space.",10,
                         db "Enter control+D to terminate.",10,0
    stringFormat db "%s",0
    

section .bss

section .text
    
fill:
    push rbp
    mov rbp,rsp
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

    push qword -1                           ;Creates an even number of pushes

    mov qword r15, rdi                      ;Move register 15 to rdi to save address of array.
    mov qword r14, rsi                      ;Move register 14 into rsi for max number of elements
    mov qword r13, 0                        ;Move register 13 to 0 for counter

    ;Displays the instructions for user input to the user
    mov qword rax, 0
    mov qword rdi, instructionPrompt
    call printf

    ;============= Begin section for start_loop======================================================================================================================================
    start_loop:
    ;Takes user input through scanf
    mov qword rdi, stringFormat
    push qword 0
    mov qword rsi, rsp
    mov qword rax,0
    call scanf

    ;If control + D is inputted then it will jump to end_loop
    cdqe
    cmp rax, -1
    je end_loop

    mov qword rax, 0
    mov qword rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid_input

    ;Converts string to a double scaling floating point value (stored in xmm12)
    mov qword rax, 0
    mov qword rdi, rsp
    call atof
    movsd qword xmm12, xmm0
    pop r8

    ;Copies the current double scaling floating point value into xmm12 and increments register 13 by 1
    movsd [r15 + 8 * r13], xmm12
    inc r13

    ;If the max number of elements has been reached it will exit
    cmp r13, r14
    je exit

    ;Loop
    jmp start_loop
    ;============= End section for start_loop========================================================================================================================================

    invalid_input:
    pop r8
    jmp start_loop
    ;============= Begin section for end_loop========================================================================================================================================
    end_loop:
    pop r8                                  ;Pops stack
    ;============= End section for end_loop==========================================================================================================================================


    ;============= Begin section for exit============================================================================================================================================
    exit:
    ; Restore all backed up registers to their original state.
    pop rax                                 ;Remove extra push of -1 from stack.
    mov qword rax, r13                      ;Moves register 13 to rax
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
    ;============= End section for exit==============================================================================================================================================
