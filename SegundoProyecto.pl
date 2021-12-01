% ===============================================
%
% (c) 2021
% version 1.0.0 2021-11-26
%
% -----------------------------------------------
% EIF400 Paradigmas de Programación
% 2do ciclo 2021, grupo 02(8pm),NRC 50043
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

evaluar(_, [], 0).%caso base una vez se encuentra la lista vacía devuelve 0
evaluar(X, [Z | Ls0], D) :- %realiza un llamado recursivo hasta que la lista este vacía
evaluar(X, Ls0, R0), D is Z + (X * R0).%una vez encuentra el caso base
                                        %realiza la múltiplicación de cada valor de la lista con X
                                        %y lo suma                               
derivar(_, 0, []).   %caso base                 
derivar([X0 | Ls0], N, D) :-%evalua cada elemento de la lista y lo multiplica por el valor de N
    N0 is N - 1,         %en lugar de usar un predicado pow 
    derivar(Ls0, N0, D0),%lo realiza de forma recursiva hasta que la lista este vacía
    X is X0 * N,
    D = [X | D0].

derivar(Ls0, D) :-%cuerpo principal
    reverse(Ls0, Ls),%no sería necesario invertir la lista 
    length(Ls, N0),%pero me resulto más comodo de trabajar
    N is N0 - 1,%aplicamos recursividad hasta que el valor N sea 0 donde N es la longitud de la lista
    derivar(Ls, N, D0),
    reverse(D0, D).

calcular(X0, P, E, R):- f(X0, P, E, R,0,0).
f(_, _, _, X0,X0,5000):-!.%la función recibe el polinomio,X,error máximo y un contador para limitar en caso de que no pueda convergir
f(X0, _, _, X0,X0,_):-!.%se trata de usar recursión de cola para encontrar la raíz planteada(no es de cola según veo)
f(Xn, P, E, R,_,C) :-%en este caso se plateo implementar un Combinador Y pero no lo logre hacer funcionar
    evaluar(Xn,P,D),%me daba varios problemas
    derivar(P,P2),%realiza la formula propuesta en el enunciado hasta encontrar la raiz(método de Newton-Raphson)
    evaluar(Xn,P2,D2),%primero calcula el resultado de evaluar P,donde P  es el polinomio a evaluar en X
    Aux is D / D2, %siguiendo con la formula procede a derivar el polinomio para volverlo a evaluar
    Xn1 is  Xn  -  Aux,
    C1 is C+1,%aumentamos contador hasta llegar a 5000
   f(Xn1, P, E, R,Xn,C1).




%calcular(X0, P, E, R):-F = \X^P^E^Ff^Pf^(
%evaluar(X,P,D), derivar(P,P2),evaluar(X,P2,D2), Aux is D / D2,Xn is X-Aux, 
%call(Pf, Xn, P,E, Pf)),
%y(F, X0, P, E, R).
%################################# No Utilizar #######################################
