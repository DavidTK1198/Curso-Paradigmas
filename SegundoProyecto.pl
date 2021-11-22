% ===============================================
%
% (c) 2021
% version 1.0.0 2021-11-26
%
% -----------------------------------------------
% EIF400 Paradigmas de Programación
% 2do ciclo 2021, grupo 02(8pm)
% Proyecto 2
%
% 117250610 Barrientos Araya,Daniel
% 
% ===============================================

% En la consola de Swi-Prolog usar pack_install("libreria") para instalar los elementos necesarios
%:- use_module(library(lambda)).%Librerias utilizadas
%:- use_module(library(lambda_abstractions)).
%:- use_module(library(apply)).

%Predicados de apoyo
pow(_, 0, 1):-!.
pow(X, N, Total) :- N0 is N - 1, %No utilizado
pow(X, N0, Acum), Total is X * Acum.

%y(Predicado, Arg,P,E ,Resultado) :- %Combinador Y
 %   Pred = ((N2,P2,E2 ,F2) :- call(Predicado, N2,P2,E2, F2, Predicado)),
  %  call(Pred, Arg,P,E, Resultado).%No utilizado

%Recibe el predicado, paramentros y el resultado calculado hasta el momento
%nos ayuda a realizar la recursión con la ayuda de la función lambda en cada predicado que es
%utilizado
%esta implementación se ve muy reflejada en el video de  Disecting a Y Combinator de  
%Byte-Sized JavaScript
%https://www.youtube.com/watch?v=EKlYknzJQkw
%-----------------------------------------------------------------

evaluar(_, [], 0).
evaluar(X, [Z | Ls0], D) :- 
evaluar(X, Ls0, R0), D is Z + (X * R0).

derivar(_, 0, []).
derivar([X0 | Ls0], N, D) :-
    N0 is N - 1,
    derivar(Ls0, N0, D0),
    X is X0 * N,
    D = [X | D0].

derivar(Ls0, D) :-
    reverse(Ls0, Ls),
    length(Ls, N0),
    N is N0 - 1,
    derivar(Ls, N, D0),
    reverse(D0, D).

calcular(Xn1, _, _, Xn):-!.
calcular(X0, P, E, R):-
evaluar(X0,P,D),
derivar(P,P2),
evaluar(X0,P2,D2),
Aux is D / D2, 
Xn is  X0  -  Aux,
calcular(Xn, P, E, X0).


%calcular(X0, P, E, R):-F = \X^P^E^Ff^Pf^(
%evaluar(X,P,D), derivar(P,P2),evaluar(X,P2,D2), Aux is D / D2,Xn is X-Aux, 
%call(Pf, Xn, P,E, Pf)),
%y(F, X0, P, E, R).
%################################# No Utilizar #######################################
