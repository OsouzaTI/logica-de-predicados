% opcoes de entrada
opcao(pao, entrada).
opcao(salada, entrada).
% opcoes de prato
opcao(carne, prato).
opcao(peixe, prato).
opcao(massa, prato).
% opcoes de sobremesa
opcao(fruta, sobremesa).
opcao(pudim, sobremesa).
opcao(sorvete, sobremesa).

% regra de menu
entrada(X) :- opcao(X, entrada).
prato(X) :- opcao(X, prato).
sobremesa(X) :- opcao(X, sobremesa).
menu(E, P, S) :-    
            entrada(E),
            prato(P),
            sobremesa(S).

exibir(E, P, S) 
    :-  write('Prato: ('),
        write(E),write(','),
        write(P),write(','),
        write(S), write(')').

---------------------------------------------

Query de busca: 
    menu(X, Y, Z), exibir(X, Y, Z), nl, fail.