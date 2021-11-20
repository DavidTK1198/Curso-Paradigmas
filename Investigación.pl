% En la consola de Swi-Prolog usar pack_install("libreria") para instalar los elementos necesarios
:- use_module(library(lambda)).%Librerias utilizadas
:- use_module(library(lambda_abstractions)).
:- use_module(library(apply)).
%-------------------------------------------------%
y(Predicado, Arg, Resultado) :- %Combinador Y
    Pred = ((N2, F2) :- call(Predicado, N2, F2, Predicado)),
    call(Pred, Arg, Resultado).
%Recibe el predicado, paramentros y el resultado calculado hasta el momento
%nos ayuda a realizar la recursión con la ayuda de la función lambda en cada predicado que es
%utilizado
%esta implementación se ve muy reflejada en el video de  Disecting a Y Combinator de  
%Byte-Sized JavaScript
%https://www.youtube.com/watch?v=EKlYknzJQkw
%-------------------------------------------------%
factorial(X,FF):-F = \Nf^Ff^Pf^( >(X,0),Nf=1 -> Ff=Nf 
; N1 is Nf-1, call(Pf, N1, F1, Pf), Ff is Nf*F1),
y(F, X, FF).
%El predicado factorial recibe un N que el número al cuál se le quiere aplicar el factorial y un posible resultado para evaluar si es verdadero
%en este caso la función lambda y el combinador Y se encarga de realizar la recursión

padovan(X,FR):- Pd=  \N^F^P^(N<4 -> F=1 %En ese caso padovan = 1 aplica para números menores que 3 incluido, por lo cual se partió desde el #4
; N1 is N-2, N2 is N-3, call(P, N1, F1, P), call(P, N2, F2, P), F is F1+F2) ,
y(Pd, X, FR).
%En este caso el predicado de padovan recibe la posición del elemento en la secuencia y el resultado esperado
%y devuelve el valor correspondiente a esa posición 
%ejemplo padovan(10,X) X=9 donde 9 sería el resultado de aplicar la formula 
%hasta N=10

%https://www.swi-prolog.org/pack/file_details/lambda/prolog/lambda.pl
%https://www.swi-prolog.org/pack/list?p=lambda_abstractions