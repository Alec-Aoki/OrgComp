# Soma dos valores de um vetor de inteiros

		.data
		# Dados do programa
		.align 2
vetor:		.word 1, 2, 3, 4, 5	
tamVetor:	.word 5
		
		.text
		# Código do programa
		.align 2
		.globl main
		# Main
main:		
		la s0, vetor # Carregando o endereço do vetor em s0
		la s1, tamVetor # Carregando o endereço de tamVetor em s1
		lw t4, 0(s1) # Carregando o valor de tamVetor em t4
		
		li t0, 0 # Resposta (soma dos elementos do vetor)
		li t1, 0 # Contador do loop (i)
		la t2, vetor # Carregando o início do endereço do vetor em t2 (indexador)
		
		# Loop
loop:		
		bge t1, t4, fim # Vai para fim se i >= tamV
		lw t3, 0(t2) # t3 = v[i]
		add t0, t0, t3 # res = res + v[i]
		addi t2, t2, 4 # Avançando o endereço no reg para o próximo valor no vetor (end. + 4 bytes)
		addi t1, t1, 1 # i++
		
		j loop # Volta para o início do loop

		# Fim
fim:		
		# Imprimindo a resposta
		mv a0, t0 # Movendo a resposta para a0
		li a7, 1 # Instrução para imprimir um inteiro
		ecall # Chamada do programa
		
		# Saindo do programa
		li a7, 10 # Instrução para encerrar o programa
		ecall # Chamada do programa
		
# int v[];
# int tamV;
# int res = 0;
# for(int i = 0; i < tamV; i++){
# 	res = res + v[i];
# }
# return res;