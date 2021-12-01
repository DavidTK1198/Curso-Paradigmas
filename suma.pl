
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-19
%
% ------------------------------------------------------

% Suma los números de la lista de DERECHA a IZQUIERDA,
% comenzando por los elementos del final, usando
% recursión de PILA (stack recursion).

suma1([],0).
suma1([X|Xr],S) :-
	suma1(Xr,Sr), S is X + Sr.

% ------------------------------------------------------

% Suma los números de la lista de IZQUIERDA a DERECHA,
% comenzando por los elementos al inicio, usando
% recursión de COLA (tail recursion).

suma2(L,S) :- suma2(L,0,S).

suma2([],S,S).
suma2([X|Xr],A,S) :-
	A1 is A + X, suma2(Xr,A1,S).

% ------------------------------------------------------

lista([29, 48, 95, 68, 13, 46, 94, 15, 9, 93, 39, 21]).

% ------------------------------------------------------

% ?- lista(L), suma1(L,X).
% L = [29, 48, 95, 68, 13, 46, 94, 15, 9|...],
% X = 570.
% ?- lista(L), suma2(L,X).
% L = [29, 48, 95, 68, 13, 46, 94, 15, 9|...],
% X = 570.
