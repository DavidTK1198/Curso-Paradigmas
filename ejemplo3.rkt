#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-12
;
; ------------------------------------------------------

(define f1
  (lambda (x) (* x x)))

(define (f1b x)
  (* x x))

(define f2
  (lambda (x y)
    (+ (* 2 x) (* 3 y))))

(define (f2b x y)
  (+ (* 2 x) (* 3 y)))

; ------------------------------------------------------

(define g1 f1) ; Asocia la función f1 con otro nombre
(define (g2 x) (f1 x)) ; Crea una función nueva que invoca a f1

; ------------------------------------------------------

(define m1
  (lambda (L)
    (if (empty? L) ; condición base (trivial)
        L ; valor del caso base
        (cons (f1 (car L)) (m1 (cdr L))) ; invocación recursiva
    )))

(define m2
  ; MAP
  ; m2 es una función de orden superior (operador funcional)
  ; ya que recibe otra funión como parámtero.
  ; Observe que la función es recursiva de PILA.
  (lambda (f L)
    (if (empty? L) L
        (cons (f (car L)) (m2 f (cdr L))))
    ))

; ------------------------------------------------------

(define L '(4 3 1 5 6))
L
(m1 L)
(m2 f1 L)
(m2 (lambda (x) (* x x)) L)
(m2 (lambda (x) (* x x x)) L)
(map f1 L)


