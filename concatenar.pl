
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-16
%
% ------------------------------------------------------

% Esta claúsula es redundante.
% concatenar([],[],[]).

% Esta claúsula es redundante, pero útil.
% Evita la necesidad de copiar cada uno de los
% elementos de la lista usada como primer parámetro
% a la segunda lista.
% Observe que el uso del operador de corte (!)
% NO es apropiado en esta cláusula, cuando se usa
% el predicado para generar listas que producen
% el resultado.
concatenar(L1,[],L1).

concatenar([],L,L).
concatenar([X|Xr],Y,[X|Yr]) :- concatenar(Xr,Y,Yr).
