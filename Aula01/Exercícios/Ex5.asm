# Função strcat(): The strcat() function concatenates the destination string and the source string, and the result is stored in the destination string.
		.data
		# Dados do programa
		.align 0 # 1 byte (chars)
str1:		.ascii "Hello" # 5 bytes de char
str1_cont:	.space	7 # Alocando 12 bytes de memória extra após a string 1
str2:		.asciz "World!" # 6 bytes de char + 1 byte de \0
		
		.text
		# Código do programa
		.align 2 # Instruções de 4 bytes
		.globl main # Ponto de entrada do programa
main:		# Main
		la s0, str1_cont # Colocando o fim do endereço da string 1 (início do espaço str1_cont) em s0
		la s1, str2 # Colocando o início do endereço da string 2 em s1
		
		mv t0, s0 # Copiando o conteúdo de s0 para t0
		mv t1, s1 # Copiando o conteúdo de s1 para t1
		
loop:		# Carrega um caractere da string 2 e guarda no fim da string 1; avança os ponteiros e checa se o ponteiro da string 2 chegou no \0
		lb t2, 0(t1) # Carrega o caractere apontado pelo ponteiro t1, ou seja, um caractere da string 2
		sb t2, 0(t0) # Carrega o caractere apontado pelo ponteiro t2 no ponteiro t1, ou seja, no fim da string 1
		
		addi t0, t0, 1 # Avançando o ponteiro da string 1
		addi t1, t1, 1 # Avançando o ponteiro da string 2

		bne t2, zero, loop # Volta para o início do loop até que o conteúdo de t2 seja \0
		
		
fim:		# Imprime a string 1 e encerra o programa
		la a0, str1 # Colocando o endereço da string 1 como argumento da função
		li, a7, 4 # Instrução para imprimir string
		ecall # Chamada do programa

		li a7, 10 # Instrução para encerrar o programa
		ecall # Chamada do programa