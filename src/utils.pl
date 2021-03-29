:- use_module(library(clpfd)).

% Leitura de arquivo.
get_lines(L, Path):-
    setup_call_cleanup(
      open(Path, read, In),
      read_data(In, L),
      close(In)
    ).
  
read_data(In, L):-
  read_term(In, H, []),
  (   H == end_of_file
  ->  L = []
  ;   L = [H|T],
  read_data(In,T)
  ).