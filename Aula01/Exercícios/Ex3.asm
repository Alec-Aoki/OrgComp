# Ler string e printar ela invertida
		.data
		# Dados do programa
		.align 0 # Alinhamento de 1 byte (chars)
string:		.space 50 # Alocando espaço estático de 50 bytes (buffer)
stringInv:	.space 50 # Espaço para a string invertida
		
		.text
		.align 2 # Instruções de 4 bytes (32 bits)
		.globl main # Ponto de entrada da função
		# Main
main:		# Lendo a string
		la a0, string # Endereço em que será guardada a string
		li a1, 50 # Tamanho máximo da string em bytes
		li a7, 8 # Instrução para ler string do usuário
		ecall # Chamada do programa
		
		mv s0, a0 # Copiando o endereço da string de a0 para s0
		mv t0, s0 # Copiando o endereço da string de s0 para t0		
		li t1, 0 # Contador do tamanho da string
		
		la s1, stringInv # s1 agora guarda o endereço do início da string invertida
		mv t3, s1 # Copiando o endereço de s1 para t3
		li t4, 0 # Contador da string invertida
		
		# Contando o tamanho da string (quantidade de caracteres)
contar_tam:	
		lb t2, 0(t0)  # Carregando o caractere da string em t2
		addi t1, t1, 1 # Aumentando o contador do tamanho da string
		addi t0, t0, 1 # Indo para o próximo caractere da string (somando o endereço em 1 byte)
		bne t2, zero, contar_tam # Volta para o início do loop até que o caractere seja diferente de \0
		
		mv s2, t1 # Salvando o tamanho da string em s2
		addi t0, t0, -2 # Voltando dois caracteres para não incluirmos o \0
		addi t1, t1, -1 # Reduzindo o tamanho da string em 1 pois não incluímos o \0
		
		
		# Invertendo a string
inverter:	
		ble t1, zero, fim # Vai para fim quando o contador da string chegar em 0
		lb t5, 0(t0) # t5 recebe o último caractere da string
		sb t5, 0(t3) # Salvando o último caractere da string no início da string invertida
		addi t0, t0, -1 # Voltando 1 caractere na string
		addi t3, t3, 1 # Indo para o próximo espaço da string invertida
		addi t1, t1, -1 # Reduzindo o contador do tamanho da string
		j inverter # Voltando para o início do loop
		

fim:
		# Imprimindo a string
		mv a0, s0
		li a7, 4
		ecall
		
		# Imprimindo a string invertida
		sb zero, 0(t3) # Colocando o \0 no final da string invertida
		mv a0, s1
		li a7, 4
		ecall
		
		# Encerrando o programa
		li a7, 10 # Instrução para encerrar o programa
		ecall # Chamada do programa		
		
# char string[50];
# char stringInvertida[50]
# int i = strlen(string[]); // Contador
# int j = 0; // Contador
# while (i > 0){
#	stringInvertida[j] = string[i];
#	i--;
#	j++;
# }