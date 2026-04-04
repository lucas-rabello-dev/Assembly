section .text

section .data
    hello db "Hello bro", 10, 0
    len equ $ - hello


say_hello:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, len
    int 0x80

    ret
