section .data
    prompt1 db 'Enter the first number : ', 0
    prompt2 db 'Enter the second number : ', 0
    resultPrompt db 'The addition of these two number is : ', 0

section .bss
    number1 resb 4
    number2 resb 4
    result  resb 4
section .global
    global _start

_start:
    call putPrompt1
    call readNumber1
    call putPrompt2
    call readNumber2
    call addition
    call putResult
    jmp _exit

putPrompt1:
    mov rax, 1
    mov rdi, 1 
    mov rsi, prompt1
    mov rdx, 25
    syscall
    ret 

putPrompt2:
    mov rax, 1
    mov rdi, 1 
    mov rsi, prompt2
    mov rdx, 26
    syscall
    ret 

putResult:
    mov rax, 1
    mov rdi, 1 
    mov rsi, resultPrompt
    mov rdx, 38
    syscall
    mov rsi, result
    mov rdx, 4
    syscall
    ret 

readNumber1:
    mov rax, 0
    mov rdi, 0
    mov rsi, number1
    mov rdx, 4
    syscall
    ret

readNumber2:
    mov rax, 0
    mov rdi, 0
    mov rsi, number2
    mov rdx, 4
    syscall
    ret

addition:
    mov rax, number1
    mov rbx, number2
    add rax, rbx
    mov [result], rax
    ret

_exit:
    mov rax, 60
    mov rdi, 0
    syscall