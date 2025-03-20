# Assembly (RISC-V)
## Estrutura base do programa
```assembly
		.data # Início do segmento de dados
		# Dados do programa
hello_msg:	.asciz "Hello World!" # **Label**, seu **tipo** e seu **conteúdo**

		.text # Início do segmento de texto
		# Código do programa
	    .globl main # Ponto de entrada do código
main:	li a7, 4 #Carregando no registrador a7 a instrução 4 (PrintString)
	    la a0, hello_msg #Carregando no registrador a0 o endereço do primeiro byte da string
	
	    ecall # Chamada do programa
	
	    li a7, 10 # Encerrando o programa com a instrução 10
	    ecall
```

## Chamadas de Programa
- PrintInt: ```1```
- PrintFloat: ```2```
- PrintDouble: ```3```
- PrintString: ```4```
- ReadInt: ```5```
- ReadFloat: ```6```
- ReadDouble: ```7```
- ReadString: ```8```
- Exit: ```10```
- PrintChar: ```11```
- ReadChar: ```12```

## Registradores
### Instruções
- ```la reg_dst, label```: carrega o endereço de um label no reg. | load address
- ```li reg_dst,  num```: carrega o valor *num* no reg. | load immediate
- ```mv  reg_dst, reg_src```: copia o valor de um reg. para outro | move
- ```add reg_dst, reg_src, reg_src```: t0 = t1 + t2 (valores) 
- ```addi reg_dst, reg_src, num```: t0 = t1 + *num*  | add immediate

## Acesso á Memória
### Tipos
- ```.word```: int (4 bytes)
- ```.half```: short int (2 bytes)
- ```.byte```: char (1 byte)
- ```.asciz```: string (chars)

### Align
```assembly
.align n
```
Alinha dados na memória para caberem em 2^n bytes.

- **Bytes:** ```.align 0``` | 2⁰ = 1 bytes = 8 bits | chars e string
- **Half Words:** ```.align 1``` | 2¹ = 2 bytes = 16 bits | short ints
- **Words:** ```.align 2``` | 2² = 4 bytes = 32 bits | ints e instruções

### Instruções
- ```lw reg_dst, offset(reg_src)```: carrega no reg. o valor (4 bytes) no endereço de memória guardado no outro reg. | load word
- ```lh reg_dst, offset(reg_src)```: carrega no reg. o valor (2 bytes) no endereço de memória | load half
- ```lb reg_dst, offset(reg_src)```: carrega no reg. o valor (1 byte) no endereço de memória | load byte
- ```sw reg_src, offset(reg_dst)```: salva na memória o valor (4 bytes) do reg. | store word
- ```sh reg_src, offset(reg_dst)```: salva na memória o valor (2 bytes) do reg. | store half
- ```sb reg_src, offset(reg_dst)```: salva na memória o valor (1 byte) do reg. | store byte

## Branches
```assembly
b t0, t1, label # Compara os valores de t0 e t1 e se for verdadeiro vai para o label especificado
```
Realizam jumps para labels

- Instruções "puras":
  -  ```beq```: branch if **equal** than
  -  ```bne```: branch if **not equal** than
  -  ```blt```: branch if **less** than
  -  ```bge```: branch if **greater or equal** than
-  Pseudo-instruções:
   -  ```bgt```: branch if **greater** than
   -  ```ble```: branch if **less or equal** than