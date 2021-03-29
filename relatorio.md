# Relatório de projeto - Sudoku

## Descrição do Problema
O Sudoku foi criado no ano de 1979, e é um jogo baseado na colocação lógica de números, cujo objetivo é alocar os números de 1 a 9 em cada uma das células vazias na grade tradicional de 9x9. Cada coluna/linha/região só pode ter um número de cada, sem repetição.

Esse quebra-cabeças divertido é um clássico problema combinacional que é facilmente resolvido utilizando o paradigma Lógico, com o Prolog, já que gerar e testar soluções é bem fácil nessa linguagem.

## Abordagem de solução
A solução para esse jogo utilizou primáriamente do módulo CLP(FD), que é responsável por toda aritimética de números inteiros no Prolog. A solução utilizada nesse projeto possui duas abordagens, uma verbosa, porém muito eficaz em processamento, e, consequentemente, em tempo de execução, e outra mais concisa, mas sem perder a eficácia.

O tempo, em média, que o programa leva para solucionar um tabuleiro de Sudoku convencional é de, aproximadamente, ```t = 0.010s```.
A seguir, print de execução, com a marca de tempo, utilizando o modulo time para tal:

![print1](./imgs/solucao_verbosa_ex.png)

Além de solucionar, o programa pode gerar um tabuleiro aleatório e verificar se um tabuleiro é válido.

## Referências
> 1. [Metalevel.at](https://www.metalevel.at/). Acessado em 24/03/2021.
> 2. [Sudoku](https://en.wikipedia.org/wiki/Sudoku). Acessado em 24/03/2021. 

