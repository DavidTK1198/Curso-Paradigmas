% ======================================================
%
% Nombre: Daniel Barrientos Araya
% cédula: 1-1725-0610
% 2021-11-27
% EIF400 – Paradigmas de Programación – NRC 50043
%
% ======================================================

% col_n([[1,2], [a,b], [w,y]], N).
% N = 2
col_n([Ls | _], N) :- length(Ls, N).
%obtener el tamaño de cada columna a formar
     
% transponer([[1,2], [a,b], [w,y]], Mx).
% Mx = [[1, a, w], [2, b, y]]
transponer(Ls,X):-transponer(Ls,1,X,[[]]).
transponer(Ls,N,X,T):-
col_n(Ls,R),%encontramos la longitud máxima de la fila
N=<R,%en este caso usamos un contador para iterar
N1 is N + 1,%este contador nos ayuda a obtener el elemento en la posición N
maplist(nth1(N), Ls, Z),%utilizando el predicado map obtenemos de [[1,2], [a,b], [w,y]= [1,a,w]
append(T,[Z],Ls1),%utilizamos append para unir las listas
transponer(Ls,N1,X,Ls1).%realizamos un llamado recursivo
transponer(_,_,X,[[]|X]):-!.%caso base!
%una vez que el predicado principal falla
%verifica sí en la última posición
%posee una lista, con una sublista vacia y N sublistas
%sí se cumple ignora la lista vacía y devuelve el resto
% que contiene la matriz transpuesta





