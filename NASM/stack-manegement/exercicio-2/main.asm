section .data
    result db 0

section .text
global _start

_start:
    
    ; funcoes com parametros em assembly (labels com parametros kkkk)
    
    push 1
    push 2
    
    call sum ; quando usamos a instrucao call, estamos colocando o endereco de retorno na pilha (stack)
    
    add al, '0' ; 48 number of ASCII table
    mov [result], al
    ; usei al nesse caso por que o numero eh pequeno!
    ; al eh a parte baixa de 8 bits do registrador rax
    ; numeros de 1 a 9 cabem em 8 bits
    
    
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1 ; buffer size
    syscall 
    
    mov rax, 60
    xor rdi, rdi
    syscall 
    
    
sum:
    pop rdx ; Guarda endereço de retorno
    pop rax  ; 2
    pop rbx  ; 1
    add rax, rbx
    push rdx    ; Coloca endereço de retorno de volta
    ret


    