
% ------------------------------------------------------
%
% (c) 2021
% Georges Alfaro S.
% version 1.0.0 2021-11-20
%
% https://en.wikipedia.org/wiki/Ackermann_function
% https://www.lix.polytechnique.fr/~liberti/public/computing/prog/prolog/prolog-tutorial.html
%
% ------------------------------------------------------

ack(0,N,Val) :- Val is N + 1.
ack(M,0,Val) :- M > 0, M1 is M-1, ack(M1,1,Val).
ack(M,N,Val) :- M > 0, N > 0, M1 is M-1, N1 is N-1, 
                ack(M,N1,Val1), ack(M1,Val1,Val).

% ?- ack(1,2,Y).
% Y = 4 .
% ?- ack(2,2,Y).
% Y = 7 .
% ?- ack(3,2,Y).
% Y = 29 .
% ?- ack(3,1,Y).
% Y = 13 .
