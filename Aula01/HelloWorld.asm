		.data
		# Dados do programa
hello_msg:	.asciz "Hello World!" # Label ("nome da variável") e seu conteúdo

		.text
		# Código do programa
	.globl main
main:	li a7, 4 #Carregando no registrador a7 a instrução 4 (PrintString)
	la a0, hello_msg #Carregando no registrador a0 o endereço do primeiro byte da string
	
	ecall # Chamada do programa
	
	li a7, 10 # Encerrando o programa com a instrução 10
	ecall
	
	