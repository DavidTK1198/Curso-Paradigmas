
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-09
%
% ------------------------------------------------------

range(A,B,[]) :- A >= B, !.
range(A,B,[A|R]) :-
	A < B, A1 is A + 1,
	range(A1,B,R).
	
nbetween(A,A,A) :- !.
nbetween(A,B,A) :- A =< B.
nbetween(A,B,X) :- A =< B,
	A1 is A + 1,
	nbetween(A1,B,X).

exclude(X,[X|Xr],Xr).
exclude(X,[W|Xr],[W|Yr]) :-
	exclude(X,Xr,Yr).

% concatenar.pl

nappend(L1,[],L1).
nappend([],L,L).
nappend([X|Xr],Y,[X|Yr]) :-
	nappend(Xr,Y,Yr).
