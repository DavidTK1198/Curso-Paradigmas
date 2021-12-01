
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.1 2021-11-07
%
% ------------------------------------------------------

ordenar([],[]).
ordenar([X],[X]).

ordenar(L,O) :- ordenar(L,[],O).

ordenar([],R,R).
ordenar([X|Xr],A,R) :-
	% El operador de corte (!) impide que Prolog
	% haga backtracking en un predicado que sabemos
	% de antemano corresponde con una función.
	insertar(X,A,Ax), !,
	ordenar(Xr,Ax,R).
	
insertar(X,[],[X]).
insertar(X,[A|Ar],[X,A|Ar]) :- =<(X,A).
insertar(X,[A|Ar],[A|Br]) :-
	>(X,A), insertar(X,Ar,Br).
