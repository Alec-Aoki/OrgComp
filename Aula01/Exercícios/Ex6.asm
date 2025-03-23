# Função strcmp(): A função começa a comparar o primeiro caractere de cada sequência. Se eles forem iguais uns aos outros, ele continuará com os pares a seguir até que os caracteres sejam diferentes ou até que o final da sequência mais curta seja atingido..
# Retorna um valor inteiro indicando o relacionamento entre as sequências:
#    < 0 -o primeiro caractere que não corresponde possui um valor inferior em string1 do que em string2
#    0 -o conteúdo de ambas as sequências é igual
#    > 0 -o primeiro caractere que não corresponde possui um valor maior em string1 do que em string2

		.data
		.align 0
str1:		.asciz "Hello" # 6 bytes
str2: 		.asciz "Hellp" # 6 bytes

		.text
		.globl main
main:
		la t0, str1
		la t1, str2
		
loop:
		lb t2, 0(t0)
		lb t3, 0 (t1)
		beq t2, t3, igual
		bgt t2, t3, maior
		blt t2, t3, menor
		
maior:
		li t4, 1
		j fim
		
menor:		li t4, -1
		j fim
		
igual:
		li t4, 0
		beq t2, zero, fim
		addi t0, t0, 1
		addi t1, t1, 1
		j loop						

fim:
		mv a0, t4
		li a7, 1
		ecall
		
		li a7, 10
		ecall