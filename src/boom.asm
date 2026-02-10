section .data
    digit   db 0, 10            
    boom    db 'Boom !', 0

section .text
    global  _start             

_start:                         
    mov     r8, 10              
    call    _loop   
    call    printBoom          
    jmp     exit               

printBoom:
    mov rax, 1
    mov rdi, 1
    mov rsi, boom
    mov rdx, 6
    syscall
    ret

_loop:
    dec r8
    call printRAXDigit
    test r8, r8
    jnz _loop
    ret

printRAXDigit:
    mov     rax, r8
    add     rax, 48             ; incrementing the value of rax register by 48 because 48 is the ASCII for 0
    mov     [digit], al         ; loading value of al (8 bit version of RAX) into [digit]

    mov     rax, 1             
    mov     rdi, 1             
    mov     rsi, digit         
    mov     rdx, 2             
    syscall                    
    ret                        

exit:                           
    mov     rax, 60            
    xor     rdi, rdi           
    syscall                    