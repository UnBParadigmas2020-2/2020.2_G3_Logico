:- ['src/sudoku'].

% Menu da aplicação.
menu:- repeat,
    nl,
    write('=== SUDOKU ==='), nl,
    write('1. Gerar sudoku.'), nl,
    write('2. Resolver sudoku (solução verbosa).'), nl,
    write('3. Resolver sudoku (solução concisa).'), nl,
    write('4. Validar sudoku.'), nl,
    write('5. Encerrar.'), nl,
    write('Digite o número seguido de um ponto final e pressione Enter.'), nl,
    read(X),
    option(X),
    X == 0,
    nl,
    !.

option(0):- !.
option(1):-
    nl,
    generate,
    menu.
option(2):-
    solve_extensive,
    menu.
option(3):-
    solve_short,
    menu.
option(4):-
    is_valid,
    menu.   
option(5):- halt(0).
    
main:-
    menu.