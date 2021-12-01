#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-15
;
; ------------------------------------------------------

(define reduce ; reduce, fold-L (desde la izquierda, usando recursión de cola)
  (lambda (f L)
    (cond ((null? L) #f)
          ((null? (cdr L)) (car L)) ; (elemento neutro)
          (else ; la lista tiene al menos dos elementos..
           (reduce f (cons (f (car L) (cadr L)) (cddr L))))
          )))

(define reduce_s ; reduce, fold-R (desde la derecha, usando recursión de pila)
  (lambda (f L)
    (cond ((null? L) #f)
          ((null? (cdr L)) (car L))
          (else
           (f (car L) (reduce_s f (cdr L))))
          )))

; ------------------------------------------------------

(define suma
  (lambda (x y)
    (+ x y)
    ))

(define max
  (lambda (x y)
    (if (< x y) y x)
    ))

(define min
  (lambda (x y)
    (if (> x y) y x)
    ))

; ------------------------------------------------------

(define L '(3 5 2 6 8 9 4 4))

(reduce suma L)
(reduce + L)
(reduce (lambda (x y) (if (< x y) y x)) '(4 2 6 1 -2 -1 12 16 23 8 9 4))
(reduce (lambda (x y) (if (> x y) y x)) '(4 2 6 1 -2 -1 12 16 23 8 9 4))
(newline)

(define R '(294 775 762 498 407 59 971 389 411 985 629 43 87 376 532 887))
(reduce min (filter (lambda (x) (zero? (remainder x 3))) R))
(reduce_s min (filter (lambda (x) (zero? (remainder x 3))) R))
(newline)

(reduce max R)
(foldl max (car R) R)
(reduce_s max R)
(foldr max (car R) R)
(newline)

; ------------------------------------------------------

(reduce min R)
(reduce max R)
(list (reduce min R) (reduce max R))
(foldl (lambda (x A) (list (min x (car A)) (max x (cadr A)))) (list (car R) (car R)) R)
