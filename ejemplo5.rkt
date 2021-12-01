#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-12
;
; ------------------------------------------------------

(define m ; map (n -> n)
  (lambda (f L)
    (if (empty? L)
        L
        (cons (f (car L)) (m f (cdr L)))
        )))

(define f ; filter (n -> m), 0 <= m <= n
  (lambda (p? L)
    (cond ((empty? L) L) ; condición trivial
          ((p? (car L))
           (cons (car L) (f p? (cdr L))))
          (else
           (f p? (cdr L)))
          )))

; ------------------------------------------------------

(m (lambda (x) (+ (* 2 x) 3)) '(2 5 4 3 6))
(map (lambda (x) (+ (* 2 x) 3)) '(2 5 4 3 6))
(f even? '(0 1 2 3 4 5 6 7 8 9 10 11 12 13))
(filter even? '(0 1 2 3 4 5 6 7 8 9 10 11 12 13))
(f (lambda (n) (zero? (remainder n 3))) '(0 1 2 3 4 5 6 7 8 9 10 11 12 13))
