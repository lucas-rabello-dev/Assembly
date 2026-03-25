## while em assembly

Como usar kkk:
o programa finazila quando você digita 'q'


### Correção da primeira versão

### Problema 1:
Eu reservei 20 bytes para fazer a leitura porém eu estava comparando apenas o primeiro byte
Não é uma coisa ruim nesse caso já que só importa o primeiro digito porém se fosse uma comparação de uma string isso já não iria funcionar

### Problema 2:
Eu estava subtraindo '0' dos caracteres.
```
    sub al, '0'
    sub bl, '0'
```

Isso só faz sentido se você estivesse lendo números ASCII entre '0' e '9'.
Mas você quer comparar 'q', e 'q' - '0' vira algum número sem sentido.

Porém por minha sorte isso funciona porque você subtrai dos dois lados, então “estraga” igual.
Mas não é uma boa prática.

Existem outras formas de comparar caracteres.

### Problema 3:
O uso do `call while` causa retornos desnecessários
Isso empilha endereço de retorno toda vez que o loop rodar.
Se repetir mil vezes, empilha mil endereços → stack explode.

Para loop use: `jmp`


