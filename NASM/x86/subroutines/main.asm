section .text

; subroutines podem ser chamadas de funcoes ja que tambem a 'funcao' de agrupar um conjunto de codigo que faz determinada coisa (sao chamadas de labels)
; para isso podemos usar duas instrucoes
; a primeira eh a 'jmp' de jump, jmp serve justamente para pular para outro label, parecido com um goto de C/C++
; a segunda eh 'call' de chamar, nesse caso nos chamamos um label
; por exemplo, estamos no label _start e precisamos chamar um label print_ logo usamos o call para isso, quando o label terminar o fluxo vai continuar dentro de _start (parecido com uma chamada de funcao em outras linguagens)
; junto de call usamos a instrucao 'ret' que server para retornar do ponto que estavamos
; quando usamos a instrucao call eh empilhado dentro da stack seu endereco de retorno para que ret saiba para onde retornar no programa
; se por exemplo seu label tiver parametros, sempre quando for usalos precisa desempilhar usando 'pop' o endereco de retorno para ret, quando o label acabar voce usa 'push' e coloca o endereco de retorno de volta para a stack

section .data
    msg db "Message", 10, 0

global _start
_start:
      
    push msg ; colocando msg na stack para usar como parametro
    call print_

    ; o fluxo do programa foi total para exit 
    jmp exit

print_:
    pop ebp ; usamos para guardar o endereco de retorno
    pop eax ; guardando msg dentro de eax

    mov edx, 9 ; tamanho da string 
    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 0x80

    push ebp
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
