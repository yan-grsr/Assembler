section .data ; Initialize data and contants
    msg db 'Hello, World', 0

section .text ; section where the program is written
    global _start
    
_start:
    jmp print ; jump to the adress print
    jmp _exit ; jump to the adress _exit

print:              ; print Hello World in console
    mov rax, 1      
    mov rdi, 1      
    mov rsi, msg    
    mov rdx, 13     
    syscall        
    
_exit:              ; exit the program using syscall
    mov rax, 60    
    mov rdi, 0     
    syscall         

