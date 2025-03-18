		.data
		# Dados
		.align 0
str1:		.asciz "Hello World++!"
str2:		.asciz "Hello World--!"

		.text
		# Programa
		.align 2 # Intruções de 32 bits
		.globl main
main:		li a7, 5 # Instrução 5: lê valor do usuário e guarda em a0 | código equivalente a "addi a7, zero, 5"
		ecall
	
		mv s0, a0 # Move o valor guardado em a0 para o registrador s0 | eq. a "add s0, a0, zero"
		blt s0, zero, print_negativo  # blt = Branch On Less Than;  compara o valor guardado em s0 com 0 e se for menor, vai para o label "print_neg"
	
		# Se o blt acima NÃO for verdadeiro, executa as linhas seguintes
		li a7, 4 # Instrução de printar na tela
		la a0, str1 # String a ser printada
		ecall
	
		# Jump incondicional para o fim do programa para evitarmos o print_negativo
		j fim
	
# Branch print_negativo
print_negativo:	li a7, 4
		la a0, str2
		ecall

# Branch fim 
fim:		li a7, 1 # Instrução de imprimir um valor guardado em um registrador
		add a0, s0, zero # Imprimindo o valor digitado (estava guardado em s0); tem que usar add pq la é pra carregar o endereço, e s0 é um registrador
		ecall
		
		li a7, 10 # Encerrando o programa
		ecall