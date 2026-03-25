section .data
    msg_s db "é igual", 0
    len_sim equ $ - msg_s
    msg_n db "não é igual", 0
    len_nao equ $ - msg_n

section .text
global _start

_start:
    ; nesse caso o rax (registrador de propósito geral está sendo usado apenas pra armazenar um valor)
    mov rax, 30
    mov rbx, 30
    ; rbx é um registrado de propósito geral podendo armazenar "qualquer" coisa
    cmp rax, rbx ; o cmp apenas subtrai o rax - rbx sem guardar o resultado em nenhum lugar
    ; ele atualiza as flags do registrador 

    ; "cada bit tem um estado da CPU" - lowwryzen

    ; flags mais importantes pra comparações:
    ; ZF (Zero Flag) → fica 1 quando A == B | se a subtração der 0 essa flag fica com o valor 1 o o je verifica isso e se for verdade ele pula
    
    ; SF (Sign Flag) → fica 1 quando o resultado foi negativo | rax = 40 - rbx = 20 = -20 ai essa flag fica como 1

    ; CF (Carry Flag) → usada em comparações de números sem sinal | CF só importa quando você trabalha com números sem sinal, fica 1 quando o primeiro valor for maior que o segundo

    ; OF (Overflow Flag) → usada em comparações de números com sinal | "OF serve pra detectar quando a operação “explodiu” o limite de números COM SINAL."  
    ; Exemplo:
        ; mov eax, 0x80000000   ; isso é -2147483648 em signed (int32)
        ; mov ebx, 1
        ; cmp eax, ebx          ; faz: -2147483648 - 1

    je igual ; aqui só ligamos pra flag ZF e vendo se a subtração for == a 0 ai se sim retorna 1 e o jump funciona
    jne nao_igual ; aqui ve se o ZF é igual a 0 que seria o oposto do de cima
    ; je -> jump if equal
    ; se for igual pule para <label>
    ; jne -> jump if not equal
    ; jg -> jump if gratter
    ; jl -> jump if less
    ; jz -> jump if zero
    ; jnz -> jump if not zero


igual:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_s
    mov rdx, len_sim
    syscall

    jmp exit

nao_igual:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_n
    mov rdx, len_nao
    syscall

    jmp exit

exit: 
    mov rax, 60
    xor rdi, rdi
    syscall
