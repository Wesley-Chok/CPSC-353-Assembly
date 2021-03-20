extern printf
extern scanf
extern fill
extern sum 
extern display

array_size equ 100

global _first

section .data
    welcomePrompt db "Welcome to HSAS.  The accuracy and reliability of this program is guaranteed by Wesley Chok.",10,0
    stringFormat db "%s",0
    numsEnteredPrompt db 10,"The numbers you entered are these:",10,0
    sumOutputPrompt db "The sum of these values is %ld",10,0
    testPrompt db "HELLO!!!!!!!!!!!!!!!!!!!!!!",10,0

section .bss
    numArray: resq 100                         ; Array with 100 reserved qwords
section .text

_first:
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

    mov qword r13, 0                           ;Push qword to r10 for number of elements in the array
    mov qword r14, 0                           ;Push qword to r11 for sum of integers in the array

    
    ;Displays the welcome message prompt to the user
    ;push qword 0
    ;mov qword rdi, stringFormat          ;Used to make space on the stack to avoid overwritting                         ;Moves data as standard input and printf uses no data as it is rax
    mov qword rdi, welcomePrompt         ;"Welcome to HSAS.  The accuracy and reliability of this program is guaranteed by Wesley Chok."
    mov qword rax, 0
    call printf
    ;pop rax


    mov qword rdi, numArray
    mov qword rsi, array_size
    mov qword rax, 0
    call fill                            ;Call the fill assembly file
    mov r13, rax

    mov qword rdi, stringFormat
    mov qword rsi, numsEnteredPrompt
    mov qword rax, 0
    call printf

    push qword 0
    mov qword rdi, numArray
    mov qword rsi, r13
    mov qword rax, 0
    call display
    pop qword rax

    mov qword rdi, numArray
    mov qword rsi, r13
    mov qword rax, 0
    call sum

    mov qword rdi, testPrompt
    mov qword rax, 0
    call printf

    
    ; push qword 0
    ; mov rdi, sumOutputPrompt
    ; mov rsi, r13
    ; mov rdx, r14
    ; mov rax, 0
    ; call printf
    ; pop rax

    ; push qword 0
    ; movsd xmm0, xmm14
    ; mov rax, 1
    ; mov rdi, sumOutputPrompt
    ; call printf







    ;Restore the registers that were backed up and defined
    pop rax                                                     ;Restoring rflags
    mov rax, r13
    popf
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