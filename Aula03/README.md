# Alocação Dinâmica
Serviço **9** da *ecall*.

Parâmetro: a0 = quant de bytes a ser reservado na heap

Retorno: a0 = endereço do 1º byte reservado

```assembly
# str_cpy dinâmica
                    .data # Dados do programa
                    .align 0 # 1 byte a 1 byte
str_src:            .asciz "Oi mae!!" # 9 bytes


                    .text # Código do programa
                    .align 2 # Instruções de 32 bits
                    .globl main # Ponto de entrada do código
```