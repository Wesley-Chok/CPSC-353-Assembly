extern printf

global sum 

section .data
    testPrompt db "HELLO!!!!!!!!!!!!!!!!!!!!!!",10,0

section .bss

section .text

sum:

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
    pushf                                                       ;Backing up rflags

    push qword -1

    mov r13, rdi                          
    mov r14, rsi                          
    mov r15, 0
    mov r12, 0
    
    

    start_loop:
    cmp r12, r14
    jge end_loop

    
    ;add r15, [r13 + 8 * r12]
    addsd xmm14, [r13 + 8 * r12]
    inc r12

    jmp start_loop
    end_loop:
    ;cvtsi2sd xmm15, r15
    ;Restore the registers that were backed up and defined
    movsd xmm0, xmm14
    pop rax                                                     ;Restoring rflags
    mov rax, r15
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


