    section .data
        msg db 'Hello, World', 0      ; Define a null-terminated string where each char takes one B

    section .text
        global _start

    _start:
        ; to print hello world
        mov rax, 1      ; syscall number for sys_write (1)
        mov rdi, 1      ; file descriptor 1 for stdout
        mov rsi, msg    ; address of the string to output
        mov rdx, 13     ; length of the string(13 char) Number of bytes to output from address given in rsi
        syscall         ; invoking the syscall

        ; to exit the program
        mov rax, 60     ; syscall number for sys_exit (60)
        xor rdi, rdi    ; exit code 0. could have wrote "mov rdi, 0"
        syscall         ; invoking the syscall

        ; clearly we don't have any bss section
