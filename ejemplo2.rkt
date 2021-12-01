#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-08
;
; ------------------------------------------------------

(define f
  (lambda (x)
    (+ (* 2 x) 3)
    ))

(define factorial
  (lambda (n)
    (if (zero? n) 1 (* n (factorial (- n 1))))
    ))

(define m1
  (lambda (L)
    (if (null? L) L
        (cons (+ (* 2 (car L)) 3) (m1 (cdr L))))
    ))

(define m2
  (lambda (L)
    (if (null? L) L
        (cons (f (car L)) (m2 (cdr L))))
    ))

; ------------------------------------------------------

(define m3
  (lambda (L g)
    (if (null? L) L
        (cons (g (car L)) (m3 (cdr L) g)))
    ))

; ------------------------------------------------------

(factorial 60)
(newline)

(m1 '(1 9 8 2 4 5 7 3 6))
(m2 '(1 9 8 2 4 5 7 3 6))
(m3 '(1 9 8 2 4 5 7 3 6) f)
