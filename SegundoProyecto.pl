% En la consola de Swi-Prolog usar pack_install("libreria") para instalar los elementos necesarios
:- use_module(library(lambda)).%Librerias utilizadas
:- use_module(library(lambda_abstractions)).
:- use_module(library(apply)).

y(Predicado, Arg, Resultado) :- %Combinador Y
    Pred = ((N2, F2) :- call(Predicado, N2, F2, Predicado)),
    call(Pred, Arg, Resultado).
%Recibe el predicado, paramentros y el resultado calculado hasta el momento
%nos ayuda a realizar la recursión con la ayuda de la función lambda en cada predicado que es
%utilizado
%esta implementación se ve muy reflejada en el video de  Disecting a Y Combinator de  
%Byte-Sized JavaScript
%https://www.youtube.com/watch?v=EKlYknzJQkw

pow(_, 0, 1):-!.
pow(X, N, Total) :- N0 is N - 1, 
pow(X, N0, Acum), Total is X * Acum.
