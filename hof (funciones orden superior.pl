
% ======================================================
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.1 2021-11-07
%
% Operadores funcionales básicos - Funciones de
% Orden Superior (Higher Order Functions)
% - map
% - filter
% - fold (reduce)
% - unfold
%
% ======================================================

% Función unaria (1-aria)

factorial(0,1) :- !.
factorial(N,F) :-
	>(N,0),
	N1 is N - 1, factorial(N1,F1),
	F is N * F1.
	
% Función unaria lógica (predicado)

par(N) :- 0 is mod(N,2).

% ------------------------------------------------------

% Funciones binarias
% (observe que las funciones son conmutativas y asociativas)

suma(X,Y,Z) :- Z is X + Y.
producto(X,Y,Z) :- Z is X * Y.

% ------------------------------------------------------

a(A0,N,A1) :- A1 is A0 + N.
c(N,S) :- S is (N * (N + 1)) / 2.

succ(N,_,N1) :- N1 is N + 1.
	
% ------------------------------------------------------

p([X,Y],[Y,X]).
	
m1([],[]).
m1([X|Xn],[Y|Yn]) :-
	factorial(X,Y),
	m1(Xn,Yn).

% ======================================================
%
% https://www.swi-prolog.org/pldoc/doc_for?object=maplist/2
% https://www.swi-prolog.org/pldoc/doc_for?object=include/3
% https://www.swi-prolog.org/pldoc/doc_for?object=foldl/4

% L = {x1,x2,x3,...,xn}
% R = {f(x1),f(x2),f(x3),...,f(xn)}
% map(L,R,f).

map([],[],_).
map([X|Xr],[Y|Yr],F) :-
	% F(X,Y), (construcción incorrecta)
	call(F,X,Y),
	map(Xr,Yr,F).
	
filter([],[],_).
filter([X|Xr],[X|Yr],P) :-
	call(P,X), !,
	filter(Xr,Yr,P).
filter([X|Xr],Yr,P) :-
	\+call(P,X),
	filter(Xr,Yr,P).
	
% Cuando se evalúa el operador fold, el valor inicial (A)
% es un elemento neutro para la función pasada como parámetro.
% Es decir: f(A,X) -> X
% Observe que si f es conmutativa: f(A,X) = f(X,A).
% El resultado es asignado solamente cuando la lista de
% elementos está vacía.

fold([],A,A,_).
fold([X|Xr],R,A,F) :- 
	call(F,A,X,A1),
	fold(Xr,R,A1,F).

% ======================================================

range(A,B,[]) :- A >= B, !.
range(A,B,[A|R]) :-
	A < B, A1 is A + 1,
	range(A1,B,R).

unfold(_,A,B,[],_) :- A >= B, !.
unfold(An,A,B,[Y|R],F) :-
	A < B, A1 is A + 1,
	call(F,An,A,Y),
	unfold(Y,A1,B,R,F).
	
unfold(A0,N,R,F) :- unfold(A0,0,N,R,F).

% ------------------------------------------------------

% ?- unfold(0,8,X,a).
% X = [0, 1, 3, 6, 10, 15, 21, 28].
% ?- range(0,8,X), map(X,R,c).
% X = [0, 1, 2, 3, 4, 5, 6, 7],
% R = [0, 1, 3, 6, 10, 15, 21, 28].

% ?- unfold(-1,8,X,succ).
% X = [0, 1, 2, 3, 4, 5, 6, 7].
% ?- range(12,19,X).
% X = [12, 13, 14, 15, 16, 17, 18].
% ?- unfold(11,7,X,succ).
% X = [12, 13, 14, 15, 16, 17, 18].

