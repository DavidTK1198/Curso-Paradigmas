#lang racket
; ======================================================
;
; Nombre: Daniel Barrientos Araya
; cédula: 1-1725-0610
; 2021-11-27
; EIF400 – Paradigmas de Programación – NRC 50043
;
; ======================================================


(define (mcd-y P m);Esta funcion se encarga de recorrer la lista de parametros y ir acumulando el m
   (if (empty? P);de la formula recurrente propuesta en el examen
       m
     (if (zero? m);al ser 0 se necesita calcular el primer valor de m
      (mcd-y (cdr P) (mcd-x (car P) (cadr P)));dado que si solo utilizo el car y cadr como valores
       (mcd-y (cdr P) (mcd-x m (car P))))));una lista como '(5 10 20 25) tendría un valor erroneo al evaluar
                                           ;al dejar abandonado el valor inicial
(define mcd
  (lambda P   ;P representa los números digitados por el usuario
    (cond ((empty? P) #f) ; no se especificaron parámetros al invocar la función devuelve falso
          ((empty? (cdr P)) ; se especificó solamente 1 parámetro se devuelve el mismo valor
           (car P))
          (else (mcd-y P 0));Si son 2 o más elementos calcula el mcd 
          )))


(define (mcd-x m n);Aplicamos la formula recurrente del mcd propuesta en el examen
  (if (= n 0)
      m
      (mcd-x n (modulo m n))));Modulo es una librería de racket


(define (mcm-x P m);Aplicamos la formula recurrente del mcm propuesta en el examen
   (if (empty? P);P es la lista digitada por el usuario
       m    ;m es el valor que se va obteniendo de forma recursiva
     (if (zero? m);al ser 0 se necesita calcular el primer valor de m
      (mcm-x (cdr P) (/ (* (mcd-x (car P) (cadr P)) (car P)) (mcd-x (car P) (cadr P))))
       (mcm-x (cdr P) (/ (* m (car P)) (mcd-x (car P) m))))));dado que si solo utilizo el car y cadr como valores
                                                             ;dejo botado el valor inicial 
                                                             ;y el resultado se ve comprometido
(define mcm
  (lambda P   ;P representa los números digitados por el usuario
    (cond ((empty? P) #f) ; no se especificaron parámetros al invocar la función devuelve falso
          ((empty? (cdr P)) ; se especificó solamente 1 parámetro se devuelve el mismo valor
           (car P))
          (else (mcm-x P 0)) ;Si son 2 o más elementos calcula el mcm 
          )))
  ;Se podría utilizar funciones lambda pero me siento más comodo haciendo funciones por aparte!


 (mcd 2016 1512 2520 504 3528)
 (mcd 10 140)
 (mcd 30 45 75)
 (mcd 140 21)
 (mcm 30 36 42)
