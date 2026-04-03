section .text

section .data
    msg db "Message", 10, 0

global _start
_start:
    mov ebx, msg
    mov eax, ebx

; o byte aqui significa que vamos comparar apenas um byte de eax com 0, sempre precisamos decidir se vamos usar byte, qword, word, etc nesses casos
next_char:
    cmp byte[eax], 0
    jz finished ; jump if not zero
    inc eax
    jmp next_char

finished:
    sub eax, ebx ; faz a subtracao entre o endereco atual da string + o endereco dps de somar +1 pra cada byte

    mov edx, eax ; valor de eax eh o tamanho da string 
    mov ecx, msg
    mov ebx, 1 ; stdout
    mov eax, 4 ; syscall para write
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
