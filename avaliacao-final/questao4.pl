funcionario(1, ana, 1000.90).
funcionario(2, bia, 1200.90).
funcionario(3, ivo, 903.50).
funcionario(4, leo, 2500.35).
funcionario(5, clo, 1800.00).
funcionario(6, gil, 1100.00).

dependente(ary, ana).
dependente(ray, ivo).
dependente(eva, ivo).
dependente(lia, leo).
dependente(noe, leo).
dependente(eli, clo).

% permite consultar os dependentes de um funcionario X
dependentes(X) :- dependente(_, X).

% dependentes de um servidor
% com salario inferior a R$950.00
salarioBaixo(X) :- 
            dependente(X, Y),
            funcionario(_, Y, S),
            S < 950.
% funcionarios sem dependentes
semDependentes(X) :- 
    funcionario(_, X, _),
    not(dependentes(X)).

% relação de funcionario com salario entre
% R$1500.00 e R$3000.00

salarioAlto(X) :- 
    funcionario(_,X,S),
    S > 1500, S < 3000.


--------------------------------------------
salarioAlto(X), write(X), nl, fail.