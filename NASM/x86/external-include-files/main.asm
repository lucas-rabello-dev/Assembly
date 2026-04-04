section .text

; incluindo arquivos e usando a diretiva extern

; extern -> "Extern eh para o compilador confiar que voce definiu uma funcao que ele nao sabe aonde, e passa o processo de resolucao pro linker" -Junior
; JuniorBecari10 :)
; extern eh uma diretiva que informa ao montador que uma 'variavel' ou 'funcao' esta definida em algum arquivo .o (object) e que eh o trabalho do linker encontrar esse arquivo

; em um arquivo no qual voce for usar o extern (o arquivo que tem a funcao ou variavel) voce precisa definir ela como global para que o linker encontre ela

%include "lib.asm"
; incluindo o arquivo lib.asm 
; o include funciona da mesma forma que o #define de C
; ele 'copia e cola' o codigo de outro aquivo aqui, assim podemos usar as variaveis declaradas la e labels

global _start
_start:
    
    call say_hello

    jmp exit 

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80


