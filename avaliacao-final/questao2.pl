% filme(Título, Gênero, Ano, Duração)
filme('Uma linda mulher', romance, 1990, 119).
filme('Sexto sentido', suspense, 2001, 108).
filme('A cor púrpura', drama, 1985, 152).
filme('Copacabana', comedia, 2001, 92).
filme('E o vento levou', drama, 1939, 233).
filme('Carrington', romance, 1995, 130).

classico(T, G, A, D) 
    :- filme(T, G, A, D), A =< 1985.

-----------------------------------------------
classico(_, _, _, X),
    write(X), nl, fail.