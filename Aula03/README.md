# Alocação Dinâmica
Serviço **9** da *ecall*.

Parâmetro: ```a0``` = quant de bytes a ser reservado na heap

Retorno: ````a0```` = endereço do 1º byte reservado

# Funções e Procedimentos
Procedimento: não retorna nada.

Função: retorna alguma coisa (void conta).

Parâmetros: ```a0``` a ```a7```

Retorno: ```a0``` e/ou ```a1```

- 2 instruções:
  - ```jal reg, label``` = *jump and link* | desvia para label e salva PC+4 no reg. (ou seja, o reg. vai guardar o endereço da próxima instrução a ser executada, ou seja, a linha debaixo) | chamada da função
  - ```jr reg``` = *jump register* | PC = reg. | retorno da função

```assembly
# . . .
li a0, 5 # Parâmetro da função
jal fatorial

# Imprimindo fatorial
mv a0, a1 # Copiando o resultado (a1) para o parâmetro da chamada do programa (a0)
li a7, 1 # Instrução para imprimir inteiro
ecall # Chamada do programa

# Função que calcula o fatorial
# a0 = número a ser calculado
# a1 = fatorial calculado
fatorial: # . . .
                jr ra
```