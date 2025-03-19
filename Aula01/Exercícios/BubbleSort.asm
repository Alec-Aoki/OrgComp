		.data
		# Dados
		.align 1 #2^1 bytes = 2 bytes
vetor:		.half 7, 5, 2, 1, 1, 3, 4 # Vetor de (meio) inteiros a ser ordenado

		.text
		# Programa (Bubble Sort)
		.align 2 # Instruções de 32 bits
		.globl main
		# Main
		# Colocando em s0 o endereço do vetor
main:		la a0, vetor
		mv s0, a0
		
		# Colocando em t0 o contador i (loop externo), inicializado com o valor -1
		li t0, -1
		
		# Colocando em s1 o tamanho do vetor-2 (5), pois iremos acessar a posição j+1, com j indo até 5 (j+1 = posição 6 do vetor)
		li t1, 5
		mv s1, t1
		

# Loop Externo: percorre todo o vetor, executando o loop interno cada vez
loop_externo:	bgt t0, s1, fim # Vai para fim se i > 6
		# Senão:
		addi t0, t0, 1 #i++
		li t1, 0 # Inicializando contador do loop interno (j) com o valor 0
		

# Loop Interno: compara elementos do vetor 2 a 2 e os troca se necessário
loop_interno:	bgt t1, s1, loop_externo # Se j > tam-1, volta para o loop externo
		# Senão:
		add t2, t1, t1 # O offset (index) avançará de 2 em 2 bytes
		add t3, s0, t2 # Colocando em t3 o endereço de vetor[j]
		
		lh t4, 0(t3) # Carregando em t4 vetor[j] (conteúdo de t3 + 0 bytes)
		lh t5, 2(t3) # Carregando em t5 vetor[j+1] (conteúdo de t3 + 2 bytes)
		
		addi t1, t1, 1 # j++
		
		bgt t4, t5, swap # Se vetor[j] > vetor[j+1], swap
		
		j loop_interno # Volta para o começo do loop interno
		
# Swap
swap:		sh t4, 2(t3) # Carregando vetor[j] em vetor[j+1]
		sh t5, 0(t3) # Carregando veotr[j+1] em vetor [j]
		
		j loop_interno # Volta para o começo do loop interno
		
# Fim do programa
fim:		
		lh a0, 0(s0)
		li a7, 1
		ecall
		lh a0, 2(s0)
		li a7, 1
		ecall
		lh a0, 4(s0)
		li a7, 1
		ecall
		lh a0, 6(s0)
		li a7, 1
		ecall
		lh a0, 8(s0)
		li a7, 1
		ecall
		lh a0, 10(s0)
		li a7, 1
		ecall
		lh a0, 12(s0)
		li a7, 1
		ecall
		li a7, 10 # Instrução para encerrar o programa
		ecall		