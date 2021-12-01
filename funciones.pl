
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-12
%
% ------------------------------------------------------

:- ['listas.pl'].

cuadrado(X,S) :- S is X * X.

% hombre(luis).
% hombre(carlos).
% hombre(roberto).

lista_hombres([luis,juan,rodrigo]).
hombre(X) :- lista_hombres(H), miembro(H,X).

mujer(adriana).
mujer(carmen).
mujer(luisa).
mujer(ana).

no_repetidos([],[]).
no_repetidos([X|Xr],Yr) :-
	miembro(Xr,X),
	no_repetidos(Xr,Yr).
no_repetidos([X|Xr],[X|Yr]) :-
	\+miembro(Xr,X),
	no_repetidos(Xr,Yr).
