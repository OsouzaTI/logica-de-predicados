filme(amnesia, suspense, nolan, 2000, 113).
filme(babel, drama, inarritu, 2006, 142).
filme(capote, drama, miller  , 2005, 98).
filme(casablanca, romance, curtiz, 1942, 102).
filme(matrix, ficcao, wachowsk, 1999, 136).
filme(rebecca, suspense, hitchcock, 1940, 130).
filme(shrek, aventura, adamson, 2001, 90).
filme(sinais, ficcao, shymalan, 2002, 106).
filme(spartacus, acao, kubrik, 1960, 184).
filme(superman, aventura, donner, 1978, 143).
filme(titanic, romance, cameron, 1997, 194).
filme(tubarao, suspense, spielberg, 1975, 124).
filme(volver, drama, almodovar, 2006, 121).


% quem dirigiu o filme titanic ?
dirigiuTitanic(X) :- filme(titanic, _, X, _, _).
% quais sao os filmes de suspense
suspense(X) :- filme(X, suspense, _, _, _).
% quais filmes foram dirigidos por donnar
filmesDonnar(X) :- filme(X, _, donner, _, _).
% em que ano foi lançado o filme sinais
filmeSinaisAno(X) :- filme(sinais, _, _, X, _).
% quais os filmes com duraçao inferior a 100min.
%-----------------Exemplo----------------------------
filmesDuracaoInf(X, Y) :- filme(Y,_, _, _, D), D < X.
% filmesDuracaoInf(100, N), write(N), nl, fail.      
%----------------------------------------------------
% quais os filmes lancados entre 2000 e 2005 ?
filmesEntre(X, Y, Z) :- filme(Z, _, _, A, _), A >= X, A =< Y.
% filmesEntre(2000, 2005, X), write(X), nl, fail.
%-----------------------------------------------------
% recupera filmes classicos (lançados antes 1980).
classico(X) :- filme(X, _, _, A, _), A < 1980.
% recupera os titulos dos filmes de um determinado genero.
genero(Y, X) :- filme(X, G, _ ,_ ,_), G = Y.
% genero(drama, X), write(X), nl, fail.
% consultas de filmes classicos de suspense
classicosSuspense(X) :- classico(X), genero(suspense, X).


----------------------------------------------------------
classicosSuspense(X),
    write(X), nl, fail.