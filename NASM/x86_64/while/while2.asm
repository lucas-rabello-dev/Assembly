; versão que eu fiz depois de estudar sobre
section .data
    output db "digite alguma coisa (q para sair): ", 0
    len_output equ $ - output

    finish_c db "finish program", 0
    len_finish equ $ - finish_c

    outro_s db "você não digitou q", 10
    len_outro equ $ - outro_s

    exit_value db "q"

section .bss
    ; eu manti os 20 bytes para evitar o que ta escrito em baixo e pula pra linha 36 que tem outra forma de evitar isso
    ; quando eu dou uma letra e o enter vai dois valores para o buffer
    ; mas isso pode acontecer se você escrever algo maior que 20 bytes
    input resb 20
    len_input equ $ - input ; se você seguir o que eu escrevi na linha 36 pode apagar isso

section .text
global _start

; label while dentro do label principal
; evitando o call nesse caso
_start:
while:

    ; mostra o prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, len_output
    syscall

    ; lê até 20 bytes
    ; mas poderia ler apenas 1 
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, len_input ; pode mudar para 1 que evita o bug que eu escrevi lá em cima
    syscall

    ; compara o primeiro char
    ; aqui não converte usando:
    ; sub al, '0' por que não estamos convertendo o char '9' para o "int"
    ; ou seja só faz isso quando for pegar valores do input e transformar em numeros se quiser trabalhar com eles
    mov al, [input] ; aqui já pega o valor do caractere pela ASCII table
    mov bl, [exit_value] ; aqui já pega o valor do caractere pela ASCII table
    cmp al, bl
    je finish

outro:
    mov rax, 1
    mov rdi, 1
    mov rsi, outro_s
    mov rdx, len_outro
    syscall
    jmp while

finish:
    mov rax, 1
    mov rdi, 1
    mov rsi, finish_c
    mov rdx, len_finish
    syscall

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
