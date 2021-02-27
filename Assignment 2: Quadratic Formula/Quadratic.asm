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
    invalidPrompt db "This input is not valid",10,0
    equationPrompt db "Thank you. The equation is %5.3lfx^2 + %5.3lfx + %5.3lf = 0.0",10,0
    goodbye db "One of these roots will be returned to the caller function",10,0
    validPrompt db "You arrived at valid sir!",10,0
    oneRootPrompt db "one root!",10,0
    twoRootPrompt db "two root!",10,0
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

    push qword 0

    ;Displays the welcome message prompt to the user
    ;push qword 0                        ;Used to make space on the stack to avoid overwritting
    mov rax, 0                          ;Moves data as standard input and printf uses no data as it is rax
    mov rdi, welcome                    ;"This program will find the roots of any quadratic equation."
    call printf

begin_loop:

    ;user input section
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
    mov rsi, rsp
    mov rdx, rsp
    add rdx, 8
    mov rcx, rsp
    add rcx, 16
    movsd xmm5, [rsp]
    movsd xmm6, [rsp+8]
    movsd xmm7, [rsp+16]
    ;pop rax
    ;pop rax
    ;pop rax
    call scanf

    ;check the user input
    mov rax, 0
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid

    ;float conversion
    mov rax,0
    mov rdi, rsp
    call atof
    movsd xmm5, xmm0

    mov rax, 0
    mov rdi, rsp
    add rdi, 8
    call isfloat
    cmp rax, 0
    je invalid

    ;float conversion
    mov rax,0
    mov rdi, rsp
    add rdi, 8
    call atof
    movsd xmm6, xmm0

    mov rax, 0
    mov rdi, rsp
    add rdi, 16
    call isfloat
    cmp rax, 0
    je invalid

    ;float conversion
    mov rax,0
    mov rdi, rsp
    add rdi, 16
    call atof
    movsd xmm7, xmm0

    jmp valid



invalid:
    ;mov rdi, three_string_format
    mov rax, 1
    mov rdi, invalidPrompt              ;"This input is not valid, try again"
    ;mov rax, 0
    call printf
    jmp begin_loop
    ;jmp begin_loop
    ;jmp begin_loop
    ;movsd xmm12, [rsp]
    ;movsd xmm13, [rsp+8]
    ;movsd xmm14, [rsp+16]
    ;pop rax
    ;pop rax
    ;pop rax

valid:
    add rsp, 1024
    pop rax
    jmp equationOutput
equationOutput:
    push qword 99
    mov rax, 3
    mov rdi, equationPrompt            ;"Thank you. The equation is %5.3lf x^2 + %5.3lf x + %5.3lf = 0.0"
    movsd xmm0, xmm5
    movsd xmm1, xmm6
    movsd xmm2, xmm7
    call printf
    pop rax
    jmp calculateRoot

calculateRoot:
    movsd xmm3, xmm5
    mulsd xmm3, xmm5
    mov r10, 4
    cvtsi2sd xmm10, r9
    mulsd xmm6, xmm7
    mulsd xmm6, xmm10
    subsd xmm6, xmm3
    mov r11, 0
    cvtsi2sd xmm11, r11
    ucomisd xmm6, xmm11
    ja twoRoot
    je oneRoot
    jb noRoot

twoRoot:
    push qword 0                  
    mov rax, 0                      
    mov rdi, twoRootPrompt              
    call printf
    jmp endOfProgram
oneRoot:
    push qword 0                  
    mov rax, 0                      
    mov rdi, oneRootPrompt              
    call printf
    jmp endOfProgram
noRoot:
    mov rax,0
    call show_no_root

endOfProgram:

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