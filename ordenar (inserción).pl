
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-07
%
% ------------------------------------------------------

% El ordenamiento se hace sobre otra lista (el resultado)
% en lugar de usar la misma indicada en el parámetro.

ordenar([],[]).
% ordenar([X],[X]).

ordenar([X|Xr],O) :- ordenar([X|Xr],[],O).

ordenar([],R,R).
ordenar([X|Xr],[],R) :- ordenar(Xr,[X],R).
ordenar([X|Xr],[A|Ar],R) :-
	insertar(X,[A|Ar],Ax),
	ordenar(Xr,Ax,R).
	
insertar(X,[],[X]).
insertar(X,[A|Ar],[X,A|Ar]) :- =<(X,A).
insertar(X,[A|Ar],[A|Br]) :-
	>(X,A), insertar(X,Ar,Br).
