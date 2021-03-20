extern printf
extern scanf
extern atolong
extern atof

global fill

section .data
    instructionOnePrompt db "Please enter floating point numbers separated by ws.",10,
                         db "When finished press enter followed by cntl+D.",10,0
    stringFormat db "%s",0
    

section .bss

section .text
    
fill:
    ;Back up the registers necessary to define them.
    push rbp
    mov rbp,rsp
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

    push qword -1

    mov qword r13, rdi                          ;Push qword to r10 for number of elements in the array
    mov qword r14, rsi                          ;Push qword to r11 for sum of integers in the array
    mov qword r15, 0


    ;Display first instruction prompt to the user 
    ;push qword 0
    mov qword rax, 0
    mov qword rdi, instructionOnePrompt
    call printf
    ;pop rax
    
    start_loop:
    mov qword rdi, stringFormat
    push qword 0
    mov qword rsi, rsp
    mov qword rax, 0
    call scanf

    cdqe
    cmp rax, -1
    je end_loop

    mov qword rax, 0
    mov qword rdi, rsp
    call atof
    movsd qword xmm12, xmm0
    pop r8

    movsd [r13 + 8 * r15], xmm12
    inc r15

    cmp r12, r11
    je exit_program

    jmp start_loop
    end_loop:
    pop r8

    exit_program:
    ;Restore the registers that were backed up and defined
    pop rax                                                     ;Restoring rflags
    mov qword rax, r15
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
    ;movsd xmm0, xmm12


    ret
