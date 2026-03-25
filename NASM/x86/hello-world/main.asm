; Optional
[BITS 32] ; or only 'bits 32'

; create varibles
section .data 


section .text
global _start

_start:
    mov eax, 1 ; rax -> 64 bits | eax -> 32 bits | ax -> 16 bits | ah and al -> 8 bits
    mov ebx, 1
    INT 80h ; INT -> interrupt | eh uma interrupcao de software onde o sistema (linux and Unix-like) usam para fazer syscalls em arquiteturas x86
    ; quando o programa executa INT 0x80 ou 80h a CPU interrompe a execucao do codigo em como usuario e transfere o controle para o kernel, usando os registradores para os parametros das syscalls
    ; conceitualmente semelhante ao 'syscall' da x86_64, porem ha diferencas de funcionamento
    ; Mecanismo	|Interrupção de software | Instrução específica para chamadas rápidas
    ; Velocidade |	Mais lento | Mais rápido
    ; Registrador (número) |EAX	| RAX
    ; Parâmetros | EBX, ECX, EDX, ESI, EDI, EBP | RDI, RSI, RDX, R10, R8, R9
    ; Ordem dos parâmetros | EBX, ECX, EDX, ESI, EDI, EBP |RDI, RSI, RDX, R10, R8, R9
