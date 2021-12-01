
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-16
%
% ------------------------------------------------------

clasificar([],[],_).
clasificar([X|Xr],A,M) :-
	clasificar(Xr,A1,M),
	agregar(X,A1,A,M).

congruente(X,Y,M) :- C is X mod M, C is Y mod M.

agregar(X,[],[[X]],_).
agregar(X,[[C|Cr]|R],[[X,C|Cr]|R],M) :-
	congruente(X,C,M).
agregar(X,[[C|Cr]|R],[[C|Cr]|Rx],M) :-
	\+congruente(X,C,M),
	agregar(X,R,Rx,M).
 