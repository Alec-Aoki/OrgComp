# Pilha
Útil para armazenar ra e a0 em funções recursivas.

## Stack Pointer
Empilhar: 
```assembly
addi sp, sp, -8 # 2*4 bytes | avança o ponteiro sp 2 words (8 bytes) pra baixo (por isso menos)
sw ra, 0(sp) # Salva ra onde sp está apontando no momento
sw a0, 4(sp) # Salva a0 1 word (4 bytes) acima do ponteiro atual
```
Desempilhar:
```assembly
lw ra, 0(sp) # Carrega o conteúdo de onde sp está apontando no momento (ra)
lw a0, 4(sp) # Carrega o conteúdo 1 word (4 bytes) acima do ponteiro atual (a0)
addi sp, sp, 8 # Volta o ponteiro sp para sua posição inicial (início da pilha) 
```