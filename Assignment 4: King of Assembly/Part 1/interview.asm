extern printf
extern scanf
extern atolong
extern atof
global _first


section .data
     welcomePrompt db "Hello %s. I am Ms Fenster. The interview will begin now.",10,0
     salaryPrompt db "Wow!  %5.3lf  That's a lot of cash. Who do you think you are, Chris Sawyer (y or n)?",0
     stringFormat db "%s",0
     programmerPrompt db 10,"Alright.  Now we will work on your electricity",10,0
     resistanceOnePrompt db "Please enter the resistance of circuit #1 in ohms: ",10,0
     resistanceTwoPrompt db "What is the resistance of circuit #2 in ohms: ",10,0
     floatFormat db "%lf",0
     resistanceOutputPrompt db "The total resistance is %lf Ohms.",10,0
     majorPrompt db "Were you a computer science major (y or n)?",0

     testPrompt db "This is the number: %lf",10,0
     testPrompted db "I'm alive and well, yes",10,0


     exitPrompt db 10,"Thank you.  Please follow the exit signs to the front desk.",10,0

     errorPrompt db "Invalid response please restart.",10,0

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

     mov r14, rdi
     movsd xmm13, xmm0

     push qword 0
     mov rax, 0
     mov rdi, welcomePrompt
     mov rsi, r15
     call printf
     pop rax

     push qword 99
     mov rax, 1
     mov rdi, salaryPrompt
     movsd xmm0, xmm13
     call printf
     pop rax

     push qword 0
     ;mov rax, 0
     mov rdi, stringFormat
     mov rsi, rsp
     call scanf
     pop rax

     mov r15, 'y'
     cmp rax, r15
     je chris_sawyer

     mov r15, 'n'
     cmp rax, r15
     je resistance

     ; mov r13, 'n'
     ; cmp rdi, r13
     ; je programmer

     ; push qword 0
     ; mov rax, 0
     ; mov rdi, errorPrompt
     ; call printf
     ; pop rax
     ; jmp exit

     resistance:
     push qword 0
     mov rax, 0
     mov rdi, programmerPrompt
     call printf
     pop rax

     push qword 99
     mov rax, 0
     mov rdi, resistanceOnePrompt
     call printf
     pop rax

     push qword -1
     mov rax, 0
     mov rdi, floatFormat
     mov rsi, rsp
     call scanf
     movsd xmm12, [rsp]
     pop rax


     push qword 99
     mov rax, 0
     mov rdi, resistanceTwoPrompt
     call printf
     pop rax

     push qword -1
     mov rax, 0
     mov rdi, floatFormat
     mov rsi, rsp
     call scanf
     movsd xmm13, [rsp]
     pop rax


     push qword 0
     mov r9, 1
     cvtsi2sd xmm9, r9
     mov r8, 1
     cvtsi2sd xmm8, r8
     mov r15, 1
     cvtsi2sd xmm15, r15

     divsd xmm9, xmm12
     divsd xmm8, xmm13

     addsd xmm8, xmm9

     divsd xmm15, xmm8

     mov rax, 1
     mov rdi, resistanceOutputPrompt
     movsd xmm0, xmm15
     call printf
     pop rax

     push qword 0
     mov rax, 0
     mov rdi, majorPrompt
     call printf
     pop rax

     push qword 0
     ;mov rax, 0
     mov rdi, stringFormat
     mov rsi, rsp
     call scanf
     pop rax

     mov r15, 'y'
     cmp rax, r15
     je programmer

     mov r13, 'n'
     cmp rax, r13
     je noMajor







     programmer:
     push qword 0
     mov rax, 0
     mov rdi, exitPrompt
     call printf
     pop rax

    ;  mov r14, 88000
    ;  cvtsi2sd xmm9, r14
    ;  mov r8, 88
    ;  cvtsi2sd xmm8, r8
    ;  mov r15, 100
    ;  cvtsi2sd xmm15, r15

    ;  divsd xmm8, xmm15

    ;  addsd xmm9, xmm8

    ;  movsd xmm0, xmm9

    ;  push qword 0
    ;  mov rax, 1
    ;  mov rdi, testPrompt
    ;  movsd xmm0, xmm9
    ;  call printf
    ;  pop rax

    ;  push qword 0
    ;  mov rax, 0
    ;  mov rdi, testPrompted
    ;  call printf
    ;  pop rax
    ;  push rdx, 0x47abe071
    ;  movsd xmm0, [rsp]
    ;  movsd xmm0, xmm9
     mov rax, 0x40F57C0E147AE148
     movq xmm14, rax
     jmp exit

     noMajor:
     push qword 0
     mov rax, 0
     mov rdi, exitPrompt
     call printf
     pop rax

     mov rax, 0x4092C07AE147AE14
     movq xmm14, rax
     jmp exit

     chris_sawyer:
     push qword 0
     mov rax, 0
     mov rdi, exitPrompt
     call printf
     pop rax

     mov rax, 0x412E848000000000
     movq xmm14, rax
     jmp exit













     exit:
     ;Restore the registers that were backed up and defined
    ; movsd xmm0, xmm9
     movsd xmm0, xmm14
     pop rax

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

    ;  push qword 0
    ;  mov rax, 1
    ;  mov rdi, testPrompt
    ;  movsd xmm0, xmm9
    ;  call printf
    ;  pop rax


     ret
