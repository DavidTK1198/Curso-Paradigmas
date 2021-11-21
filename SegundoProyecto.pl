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
pow(X, N, Total) :- N0 is N - 1, 
pow(X, N0, Acum), Total is X * Acum.

producto([],_,[_]).

producto([0|Ls0],A,[_]):-
 A0 is A+1,
producto(Ls0,A0,[_]).

producto([Z | Ls0],A,[X]):-
N is A*Z,
A0 is A+1.

insertar(X,[],[X]).
insertar(X,[A|Ar],[X,A|Ar]) :- =<(X,A).
insertar(X,[A|Ar],[A|Br]) :-
	>(X,A), insertar(X,Ar,Br).

%-----------------------------------------------------------------

evaluar(_, [], 0).
evaluar(X, [Z | Ls0], D) :- 
evaluar(X, Ls0, R0), D is Z + (X * R0).

derivar([X],D):- producto(X,0,D).

