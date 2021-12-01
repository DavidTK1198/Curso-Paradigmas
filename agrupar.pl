
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-07
%
% ------------------------------------------------------

p(a).
p(b).
p(c).
p(d).

p(X) :- r(X).

r(a).
r(b).
r(e).

% --------------------------------------------------

q(P,F) :- q(P,F,[]).

q(P,F,E) :-
	call(F,X), \+member(X,E), !,
	% [X|E] -> E1
	append(E,[X],E1),
	q(P,F,E1).
q(E,_,E).

% --------------------------------------------------
%
% 1. ¿Porqué el caso trivial va al final?
% 2. ¿Porqué utilizar append en lugar de agregar el elemento
%    al inicio de la lista?
% 3. ¿Porqué findall/3 encuentra elementos repetidos dentro
%    de la solución, y el predicado q/2 no lo hace?
%
% 4. ¡IMPORTANTE!
%    El operador de corte (!) se utiliza para evitar que
%    se evalúe el caso trivial cuando efectivamente se
%    encuentra un valor de X que satisface p(X).
%
% --------------------------------------------------

unique([],[]).
unique([X|Xr],Yr) :-
	member(X,Xr), !,
	unique(Xr,Yr).
unique([X|Xr],[X|Yr]) :-
	% \+member(X,Xr),
	unique(Xr,Yr).
