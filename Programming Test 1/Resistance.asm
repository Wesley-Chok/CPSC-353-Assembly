extern printf
extern scanf
global _first

segment .data
    inputResistancePrompt db "Please enter the resistance numbers of the two subcircuits separated by ws and press enter.",10,0
    outputResistance1Prompt db "These resistances were received: %7.10lf Ω, %7.10lf Ω, %7.10lf Ω,",10,0
    three_float_format db "%lf%lf%lf", 0
    outputResistance2Prompt db "The resistance of the entire circuit is  %5.3lf Ω",10,0
    float_format db "%lf",0
    goodbyePrompt db "The total resistance will be returned to the caller module."

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

    push qword 0

    ;user input section
    push qword 99
    mov rax, 0
    mov rdi, inputResistancePrompt ;"Please enter the resistance numbers of the two subcircuits separated by ws and press enter."
    call printf
    pop rax

    push qword -1                   ;make space on the stack for user input
    push qword -2                   ;make space on the stack for user input
    push qword -3                   ;make space on the stack for user input
    mov rax, 0
    mov rdi, three_float_format     ;"%lf%lf%lf"
    mov rsi, rsp                    ;this will point to the first quadword
    mov rdx, rsp
    add rdx, 8                      ;this will point to the second quadword
    mov rcx, rsp
    add rcx, 16                     ;this will point to the third quadword
    call scanf

    movsd xmm12, [rsp]
    movsd xmm13, [rsp+8]
    movsd xmm14, [rsp +16]
    pop rax                         ;reverse push by 1
    pop rax                         ;reverse push by 1
    pop rax                         ;reverse push by 1

    push qword 99
    mov rax, 3                          ;to input 3 values
    mov rdi, outputResistance1Prompt    ;"These resistances were received: %7.10lf Ω, %7.10lf Ω, %7.10lf Ω,"
    movsd xmm0, xmm12
    movsd xmm1, xmm13
    movsd xmm2, xmm14
    call printf
    pop rax

    ;Calculation
    push qword 0
    mov r9, 1                           ;sets r9 equal to 1          
    cvtsi2sd xmm9, r9                   ;converts r9 into a scalar double-precision floating-point
    mov r8, 1                           ;sets r8 equal to 1  
    cvtsi2sd xmm8, r8                   ;converts r8 into a scalar double-precision floating-point
    mov r15, 1                          ;sets r9 equal to 1  
    cvtsi2sd xmm15, r15                 ;converts r15 into a scalar double-precision floating-point
    mov r10, 1                          ;sets r10 equal to 1  
    cvtsi2sd xmm10, r10                 ;converts r10 into a scalar double-precision floating-point

    divsd xmm9, xmm12                   ;divides xmm9 over xmm12
    divsd xmm8, xmm13                   ;divides xmm8 over xmm13
    divsd xmm15, xmm14                  ;divides xmm15 over xmm14
    
    addsd xmm9, xmm8                    ;add xmm9 and xmm8
    addsd xmm9, xmm15                   ;add xmm9 and xmm15
    
    divsd xmm10, xmm9                   ;divide xmm10 over xmm9


    ;output section
    mov rax, 1
    mov rdi, outputResistance2Prompt    ;"The resistance of the entire circuit is  %5.3lf Ω"
    movsd xmm0, xmm10                   ;store xmm10 into xmm0
    call printf
    pop rax

    ;Display goodbye message
    mov rax, 0
    mov rdi, goodbyePrompt              ;"The total resistance will be returned to the caller module."
    call printf

    pop rax

    movsd xmm0, xmm10                   ;store xmm10 into xmm0


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