section .data
    out1 db "Digite um número: ", 0
    len_out1 equ $ - out1

    out2 db "Digite outro número: ", 0
    len_out2 equ $ - out2

    msg_equal db "Is equal!", 0
    len_msg_equal equ $ - msg_equal

    msg_not_equal db "Isn't equal!", 0
    len_msg_not_equal equ $ - msg_not_equal 

section .bss
    first resb 4
    len_first equ $ - first

    second resb 4
    len_second equ $ - second

section .text
global _start

_start:
    mov rax, 1 ; syscall write
    mov rdi, 1 ; stdout
    mov rsi, out1 ; memory adress of variable
    mov rdx, len_out1 ; buffer size
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, first
    mov rdx, len_first
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, out2
    mov rdx, len_out2
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, second
    mov rdx, len_second
    syscall

    ; ------------------------------- Feito por mim, estava lendo caracteres ASCII pois eu não converti para numeros ---------------------------
    ; mov rax, [first]
    ; mov rbx, [second]
    ; cmp [first], [second] ta errado !!!!!
    ; cmp rax, rbx
    ; je equal ; jump if equal
    ; jne not_equal ; jump if not equal
    ; -----------------------------------------------------------------------------------------------------------------------------------------------

    ; ------------------------------------- chatgpt ----------------------------------------------------
    ; ---- carrega o primeiro caractere de cada número ----
    mov al, [first]       ; pega só o caractere
    sub al, '0'           ; converte ASCII para número 0–9

    mov bl, [second]
    sub bl, '0'

    ; ---- compara ----
    cmp al, bl
    je equal
    jne not_equal
    ; -------------------------------------------------------------------------------------------------------

equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_equal
    mov rdx, len_msg_equal
    syscall

    jmp exit

not_equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_not_equal
    mov rdx, len_msg_not_equal
    syscall

    jmp exit

exit:
    mov rax, 60 ; syscall exit
    xor rdi, rdi ; equal 0 
    syscall