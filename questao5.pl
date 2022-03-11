% voo, destino, hora_prev hora_real
partida('TP123', lisboa, '14h30', '14h30').
partida('NI234', manchester, '15h25', '16h00').
partida('TP876', faro, '14h18', '14h30').
partida('NI498', madrid, '15h00', '15h00').

% voo origem hora_prev hora_real
chegada('TP123', lisboa, '14h00', '14h35').
chegada('NI533', funchal,'15h00', '15h00').
chegada('TP877', santiago,'14h30', '15h00').
chegada('NI498', manchester,'16h00', '15h50').

% determina se a hora prevista de um voo e
% a mesma da hora real. 
parteAHoras(X) :- partida(X, _, P, R), P = R.
% determina se um voo faz viagens de, e para,
% uma mesma cidade
vaiVem(X) :- partida(X, D, _, _),
             chegada(X, O, _, _),
             D = O.
% determina se existe um voo que executa a
% ligacao X para Y
ligacao(X, Y) :- chegada(V, X, _, _),
                 partida(V, Y, _, _),
                 not(X = Y), V = V.

% retorna o primeiro elemento de uma lista
elem0([X|_], X).
% retorna o segundo elemento de uma lista
elem1([_, X|_], X).
% retorna um atomo de uma string ex: '1' -> 1
inteiro(X, Y) :- atom_number(X, Y).
% data uma hora em formato '10h00' retorna em A -> 10, B -> 0.
hora(X, A, B) :-
    split_string(X, 'h', '', L),
    elem0(L, C), elem1(L, D),
    inteiro(C, A), inteiro(D, B).
% determina se o horario X e maior que o horario Y
horaMaior(X, Y) :- 
    hora(X, A, _), hora(Y, C, _), A > C;
    hora(X, A, B), hora(Y, C, D), A = C, B > D.
% determina se um voo esta atrasado
chegaAtrasado(X) :- chegada(X, _, A, B), horaMaior(B, A).
% determina se existe conflito de horarios
emConflito(X) :- partida(X, _, _, A),
                 chegada(X, _, _, B),
                 not(horaMaior(B, A)).

-----------------------------------------------------------
emConflito(X), write(X), nl.