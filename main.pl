:- use_module(library(clpfd)).
:- use_module(library(dcg/basics), except([eos/2])).

% Solução verbosa para um problema combinacional famoso: o sudoku.
% Essa solução utiliza o módulo clpfd.

solve(P):-
    sudoku(P),
    forall(member(R,P), (print(R),nl)).
    
% Solução verbosa, porém eficiente de se resolver a tabela 9x9 de sudoku.

sudoku([[A1,B1,C1,D1,E1,F1,G1,H1,I1],
        [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        [A9,B9,C9,D9,E9,F9,G9,H9,I9]]):-
    
    Vars = [A1,B1,C1,D1,E1,F1,G1,H1,I1,
            A2,B2,C2,D2,E2,F2,G2,H2,I2,
            A3,B3,C3,D3,E3,F3,G3,H3,I3,
            A4,B4,C4,D4,E4,F4,G4,H4,I4,
            A5,B5,C5,D5,E5,F5,G5,H5,I5,
            A6,B6,C6,D6,E6,F6,G6,H6,I6,
            A7,B7,C7,D7,E7,F7,G7,H7,I7,
            A8,B8,C8,D8,E8,F8,G8,H8,I8,
            A9,B9,C9,D9,E9,F9,G9,H9,I9],
    Vars ins 1..9,

    % Garantir que todas as linhas contém números diferentes entre si.
    all_different([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
    all_different([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
    all_different([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
    all_different([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
    all_different([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
    all_different([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
    all_different([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
    all_different([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
    all_different([A9,B9,C9,D9,E9,F9,G9,H9,I9]),

    % Garantir que todas as colunas contém números diferentes entre si.
    all_different([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
    all_different([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
    all_different([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
    all_different([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
    all_different([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
    all_different([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
    all_different([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
    all_different([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
    all_different([I1,I2,I3,I4,I5,I6,I7,I8,I9]),

    % Adicionando a separação dos quadrantes do sudoku.
    % 1
    all_different([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
    all_different([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
    all_different([G1,G2,G3,H1,H2,H3,I1,I2,I3]),
    % 2
    all_different([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
    all_different([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
    all_different([G4,G5,G6,H4,H5,H6,I4,I5,I6]),
    % 3
    all_different([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
    all_different([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
    all_different([G7,G8,G9,H7,H8,H9,I7,I8,I9]),
    label(Vars).

% Menu da aplicação.

menu:- repeat,
    write('=== MENU ==='), nl,
    write('1. Gerar sudoku aleatório.'), nl,
    write('2. Resolver sudoku.'), nl,
    write('3. Validar sudoku.'), nl,
    write('4. Encerrar.'), nl,
    read(X),
    option(X),
    X == 0,
    !.

option(0):- !.
option(2):- 
    getLines(L, 'example1.txt'),
    solve(L).
option(4):- halt(0).

% Leitura de arquivo.

getLines(L, Path):-
    setup_call_cleanup(
      open(Path, read, In),
      readData(In, L),
      close(In)
    ).
  
  readData(In, L):-
    read_term(In, H, []),
    (   H == end_of_file
    ->  L = []
    ;   L = [H|T],
        readData(In,T)
    ).
    
main:-
    menu.