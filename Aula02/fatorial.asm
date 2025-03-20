		.data
		# Dados do programa
		.align 1
msg1:		.asciz "Digite o número cujo fatorial você quer calcular: "
msg2:		.asciz "Resultado: "
msg3:		.asciz "! = "
		
		.text
		# Código do programa
		.align 2 # Instruções de 2² bytes (4 bytes = 32 bits)
		.globl main # Ponto de entrada do programa
		# Main
main:		
		# Imprimindo mensagem 1
		la a0, msg1 # Carregando a string em a0
		li a7, 4 # Instrução de imprimir string
		ecall # Chamada do programa
		
		# Lendo input do usuário		
		li a7, 5 # Lê input (n)
		ecall # Chamada do programa
		
		mv s0, a0 # Valor digitado pelo usuário guardado em s0
		
		# Contador e resultado
		mv t0, s0 # Contador decremental (i) (n -> 0)
		li t1, 1 # Resultado (0! = 1)
		
		# Loop
loop:		# Fatorial não recursivo e decremental
		beq t0, zero, final # Se contador == 0, vai para o fim do programa
		mul t1, t1, t0 # t1 = t1 * t0 (res = res * i)
		addi t0, t0, -1 # Decrementando contador (i--)
		j loop
		

		# Final
final:		# Imprimindo os resultados
		la a0, msg2 # Carregando msg 2 em a0
		li a7, 4 # Instrução de imprimir string
		ecall # Chamada do programa
		
		mv a0, s0 # Carregando o número digitado pelo usuário em a0
		li a7, 1 # Instrução para imprimir um inteiro
		ecall # Chamada do programa
		
		la a0, msg3 # Carregando ms3 em a0
		li a7, 4 # Instrução de imprimir string
		ecall # Chamada do programa
		
		mv a0, t1 # Colocando o resultado em a0
		li a7, 1 # Instrução para imprimir um inteiro
		ecall # Chamada do programa
		
		li a7, 10 # Instrução para encerrar o programa
		ecall # Chamada do programa


		
		
# Fatorial iterativo decremental
# int res = 1;
# for(int i = n; i > 0; i--){
#	res = res * i;
# }
#


# Branches (branch if...)
# beq = equal
# bne = not equal
# blt = less than
# bge = greater or equal than
# bgt = greater than
# ble = less or equal than