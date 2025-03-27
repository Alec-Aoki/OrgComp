		.data # Dados do programa
		
		.text # Código do programa
		.align 2 # Instruções de 32 bits
		.globl main # Ponto de entrada do código
main:		
		li a7, 5 # Instrução para ler inteiro do usuário (n)
		ecall # Chamada do programa
		# O inteiro lido agora está no registrador a0
		mv s0, a0 # Copiando o inteiro de a0 para s0

		# Indo pra função fatorial (ITERATIVA)
		jal ra, inicio

		# Imprime o resultado
		li a7, 1 # Instrução para printar um inteiro
		ecall # Chamada do programa
		
		# Encerra o programa		
		li a7, 10 # Instrução para encerrar o programa
		ecall # Chamada do programa
		
inicio:		# Fatorial iterativo
		li t0, 1 # Resposta
		mv t1, s0 # Colocando n em t1
		beq t1, zero, fim
		
loop:
		mul t0, t0, t1 # res = res * n - 1
		addi t1, t1, -1 # n--
		bne t1, zero, loop # Volta para o início do loop caso n != 0
fim:	
		mv a0, t0 # Colocando a resposta em t0
		jr ra # Voltando para o return address (linha logo após o jal)