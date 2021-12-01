
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-07
%
% ------------------------------------------------------

factorial(N,F) :- f(N,F,1).

f(0,F,F) :- !.
f(N,F,A) :-
	>(N,0),
	N1 is N - 1, A1 is N * A,
	f(N1,F,A1).
