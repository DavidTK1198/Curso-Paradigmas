
c(a, b, 1).
c(a, c, 2).
c(a, e, 1).
c(b, c, 2).
c(c, d, 4).
c(d, e, 2).
c(d, g, 1).
c(e, f, 3).
c(g, h, 2).
c(h, g, 1).

rutaMinima(I,I,[[I,0]]).
rutaMinima(I,D,R) :- rutaMinima(D,R,[[I,0]],[]).
