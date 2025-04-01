# Fatorial Recursivo
# int fatorial (int n){
#	if (n == 0) return 1;
#	return (n * fatorial(n-1));
# }

		.data # Dados do programa
		.align 0 # 1 byte = 4 bits
stringEnt:	.asciz "Digite o numero: "
stringSaida:	.asciz "Fatorial calculado: "

		.text # Código do programa
		.align 2 # Instruções/palavras de 32 bits
		.globl main # Ponto de entrada do programa
main:		
		# Imprimindo string de entrada
		li a7, 4 # Instrução para imprimir string
		la a0,  stringEnt # Parâmetro da instrução: stringEnt
		ecall # Chamada do programa
		
		# Recebendo número do usuário
		li a7, 5 # Instrução para ler o valor digitado pelo usuário
		ecall # Chamada do programa, o valor digitado é armazenado em a0
		
		mv s0, a0 # Colocando o valor digitado pelo usr. (a0) em s0
		
		jal fatorial # Desvia para o label fatorial e salva a próxima linha como return address
		
		mv s1, a1 # Colocando o valor retornado pela função fatorial (a1) em s1
		
		# Imprimindo o resultado
		li a7, 4 # Instrução para imprimir string
		la a0, stringSaida # Parâmetro da instrução: stringSaida
		ecall # Chamada do programa
		
		li a7, 1 # Instrução para imprimir inteiro
		mv a0, s1 # Parâmetro da função: resultado do fatorial (s1)
		ecall # Chamada do programa
		
		li a7, 10 # Instrução para encerrar o programa
		ecall # Chamada do programa

# Função fatorial RECURSIVA
# a0: número a ser calculado
# a1: resultado (fatorial do número escolhido)	
fatorial:
		# Empilhando ra e a0
		addi sp, sp, -8 # Atualizando o ponteiro (avançando)
		sw ra, 0(sp) # Salvando o ra na mem. onde o pont. aponta
		sw a0, 4(sp) # Salvando o a0 4 bytes (1 word) acima da onde o pont. aponta
		
		beq a0, zero, retorna_1 # Quando n == 0, vai pro label retorna_1
		
		addi a0, a0, -1 # Atualizando o parâmetro (a0)
		jal fatorial # Chama a função recursiv. para n-1
		
		# ra
		# Como acabamos de começar a desempilhar, a0 = 0
		addi a0, a0, 1 # Então incrementamos o a0
		mul a1, a1, a0 # res = res * n
		
		j retornaFat
		
retorna_1:	
		li a1, 1 # 0! = 1

retornaFat:		
		# Desempilhando (voltando na recursão)
		lw ra, 0(sp) # Pegando o returna address da pilha
		lw a0, 4(sp) # Pegando o número da pilha
		addi sp, sp, 8 # Decrementando o ponteiro (voltando)
		jr ra # Indo para o ra desempilhado
		