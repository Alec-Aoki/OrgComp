		.data
		# Dados do programa
		.align 0 # 1 byte
str_src:	.asciz "Oi mãe! Estou na USP" # String que ocupa 24 bytes
str_dst:	.space 24 # Reserva 24 bytes na parte de dados estáticos
		
		.text
		# Código do programa
		.align 2 # Instruções de 4 bytes
		.globl main
main:		
		la s0, str_src # s0 guarda o endereço de str_src (1° byte)
		la s1, str_dst # s1 guarda o endereço de str_dst (1° byte)
		
		# Loop (do while)
loop:
		lb t0, 0(s0) # t0 = s0 + 0
		sb t0, 0(s1) # s1 + 0 = t0
		
		addi s0, s0, 1 # Avançando o ponteiro de str_src
		addi s1, s1, 1 # Avançando o ponteiro de str_dst
		
		bne t0, zero, loop # Para quando t0 apontar para \0 (fim da string)
		
		# Fim (imprimir string e encerrar programa)
		la a0, str_dst
		li a7, 4
		ecall
		
		li a7, 10
		ecall
		
		