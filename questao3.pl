% pessoa(Nome, Sexo, Altura)
pessoa(ana, f, 1.68).
pessoa(bia, f, 1.75).
pessoa(ivo, m, 1.73).
pessoa(rai, m, 1.57).

homem(X, N) :- pessoa(N, m, X).
mulher(X, N) :- pessoa(N, f, X).

exibir(X, Y) :- write(X),
                write(' '),
                write(Y), nl.

casal(X, Y) :-  homem(X, N),
                mulher(Y, P),
                X > Y,
                exibir(N, P). 
-----------------------------------------------
casal(X, Y), fail.