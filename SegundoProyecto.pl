%
% ===============================================
%
% (c) 2021
% version 1.0.0 2021-11-26
%
% -----------------------------------------------
% EIF400 Paradigmas de Programación
% 2do ciclo 2021, grupo 02(8pm)
% Proyecto 2
%
% 117250610 Barrientos Araya,Daniel
% 
% ===============================================
%
%Predicados de apoyo
pow(_, 0, 1):-!.
pow(X, N, Total) :- N0 is N - 1, %No utilizada
pow(X, N0, Acum), Total is X * Acum.
%-----------------------------------------------------------------

evaluar(_, [], 0).
evaluar(X, [Z | Ls0], D) :- 
evaluar(X, Ls0, R0), D is Z + (X * R0).

derivar(_, 0, []).
derivar([X0 | Ls0], N, D) :-
    N0 is N - 1,
    derivar(Ls0, N0, D0),
    X is X0 * N,
    D = [X | D0].

derivar(Ls0, D) :-
    reverse(Ls0, Ls),
    length(Ls, N0),
    N is N0 - 1,
    derivar(Ls, N, D0),
    reverse(D0, D).

