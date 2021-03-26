% solucao verbosa para um problema combinacional famoso, o sudoku
% essa solucao utiliza o modulo clpfd

:- use_module(library(clpfd)).

solve(P):-
    sudoku(P),
    forall(member(R,P), (print(R),nl)).