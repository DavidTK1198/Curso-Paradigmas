
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-09
%
% ------------------------------------------------------

primero([X|_],X).
segundo([_,X|_],X).
tercero([_,_,X|_],X).

ultimo([X],X) :- !.
ultimo([_|Xr],X) :-
	ultimo(Xr,X).
	
penultimo([X,_],X) :- !.
penultimo([_|Xr],X) :-
	penultimo(Xr,X).

% ------------------------------------------------------

miembro(X,[X]) :- !.
miembro(X,[X|_]).
miembro(X,[_|Xr]) :-
	miembro(X,Xr).
	
% ------------------------------------------------------

n_esimo(1,[X|_],X) :- !.
n_esimo(N,[_|Xr],X) :-
	>(N,1), N1 is N - 1,
	n_esimo(N1,Xr,X).
