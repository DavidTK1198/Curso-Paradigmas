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
pow(_, 0, 1):-!.
pow(X, N, Total) :- N0 is N - 1, 
pow(X, N0, Acum), Total is X * Acum.%No utilizada


evaluar(_, [], 0).
evaluar(X, [Z | Ls0], D) :- 
evaluar(X, Ls0, R0), D is Z + (X * R0).