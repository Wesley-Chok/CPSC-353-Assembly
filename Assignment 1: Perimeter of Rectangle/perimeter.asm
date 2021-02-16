extern printf
extern scanf
global _first

segment .data
    welcome db "Welcome to an friendly assembly program by Wesley Chok",10,0
    description db "This program will compute the perimeter and the average side length of a rectangle",10,0
    inputHeightPrompt db "Enter the height",0
    inputWidthPrompt db "Enter the width",0
    float_format db "%lf",0
    outputPerimPrompt db "The perimeter is",10,0
    outputAvgPrompt db "The length of the average side is %5.3lf",10,0
    goodbyePromptOne db "The assembly program will send the perimeter to the main function",10,0
    

segment .bss

segment .text

_first:
    push rbp
    mov  rbp,rsp
    push rdi                                                    ;Backup rdi
    push rsi                                                    ;Backup rsi
    push rdx                                                    ;Backup rdx
    push rcx                                                    ;Backup rcx
    push r8                                                     ;Backup r8
    push r9                                                     ;Backup r9
    push r10                                                    ;Backup r10
    push r11                                                    ;Backup r11
    push r12                                                    ;Backup r12
    push r13                                                    ;Backup r13
    push r14                                                    ;Backup r14
    push r15                                                    ;Backup r15
    push rbx                                                    ;Backup rbx
    pushf                                                       ;Backup rflags

    ;Displays the welcome message prompt to the user
    push qword 0
    mov rax, 0
    mov rdi, welcome                ;"Welcome to an friendly assembly program by Wesley Chok"
    call printf

    ;Display the decription message prompt to the user
    push qword 0
    mov rax, 0
    mov rdi, description            ;"This program will compute the perimeter and the average side length of a rectangle"
    call printf
    pop rax

    ;============= Begin section to input the height========================================================
    ;Display height message prompt to the user
    push qword 0
    mov rax, 0
    mov rdi, inputHeightPrompt      ;"Enter the height"
    call printf
    pop rax
    ;============= End section to input the height========================================================


    ;============= Begin section to input the width========================================================
    push qword 0
    mov rax, 0
    mov rdi, inputWidthPrompt       ;"Enter the width"
    call printf
    pop rax
    ;============= End section to input the width========================================================