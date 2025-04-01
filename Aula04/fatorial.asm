		# Fatorial com função (jal e jr)
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

# Função fatorial
# a0: número a ser calculado
# a1: resultado (fatorial do número escolhido)	
fatorial:
		li s1, 1 # Resposta
		mv t0, a0 # Copiando o número a ser calculado (a0) para t0
		beq  t0, zero, fim
loop:		
		mul s1, s1, t0 # res = res * n
		addi t0, t0, -1 # n--
		bne t0, zero, loop # Volta para o início do loop caso t0 (n) seja diferente de 0
fim:		
		mv a1, s1 # Colocando a resposta (s1) em a1
		jr ra # Voltando para o return address