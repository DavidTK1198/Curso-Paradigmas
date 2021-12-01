#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-19
;
; ------------------------------------------------------

(define rng
  (lambda P
    (cond ((empty? P) '()) ; no se especificaron parámetros al invocar la función
          ((empty? (cdr P)) ; se especificó solamente 1 parámetro (límite superior)
           (rng-x 0 (car P) 1 '()))
          ((empty? (cddr P)) ; se especificaron 2 parámetros (límites inferior y superior)
           (rng-x (car P) (cadr P) 1 '()))
          ((empty? (cdddr P)) ; se especificaron todos los parámetros (3)
           (rng-x (car P) (cadr P) (caddr P) '()))
          (else #f)
          )))

(define rng-x ; Función corecursiva
  (lambda (a b s R)
    (if (< a b)
        (rng-x (+ a s) b s (append R (list a)))
        R)
    ))

; ------------------------------------------------------

; (rng-x 4 7 1 '())
;
; '(5 7 1 '(4))
; '(6 7 1 '(4 5))
; '(7 7 1 '(4 5 6))
; '(8 7 1 '(4 5 6 7))
;
; (rng-x 5 12 2 '())
;
; (7 12 2 '(5))
; (9 12 2 '(5 7))
; (11 12 2 '(5 7 9))
; (13 12 2 '(5 7 9 11))

; ------------------------------------------------------

(define (max x y) (if (< x y) y x))

(define f1
  (lambda (L) ; un único parámetro
    (foldl max (car L) (cdr L))
    ))

(define f2
  (lambda P ; una lista de parámetros
    (foldl max (car P) (cdr P))
    ))

; ------------------------------------------------------

(rng 20)
(rng 0 20)
(rng 4 20)
(rng 4 20 3)

(f1 '(1 3 5 4 8 7 9 2 3))
(f2 1 3 5 4 8 7 9 2 3)

