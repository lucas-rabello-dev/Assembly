; Ele não cria variável, não cria label, não reserva memória.
; Ele só manda o assembler substituir texto antes de montar o código.

section .data
    sim db "sim", 0


%define CODE_OUTPUT_AND_SYSCALL 1


section .text
global _start
_start:
    mov rax, CODE_OUTPUT_AND_SYSCALL
    mov rdi, CODE_OUTPUT_AND_SYSCALL
    mov rsi, sim
    mov rdx, 3
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

