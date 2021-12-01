#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-19
;
; ------------------------------------------------------

(define rng ; range
  (lambda (a b)
    (rng-x a (- b 1) '())
    ))

(define rng-x
  (lambda (a b R)
    (cond ((<= a b)
           (rng-x a (- b 1) (cons b R)))
          (else
           R))
    ))
; ------------------------------------------------------

; (rng 4 8) -> (rng-x 4 7 '())
;
; '(4 7 '())
; '(4 6 '(7))
; '(4 5 '(6 7))
; '(4 4 '(5 6 7))
; '(4 3 '(4 5 6 7))

; ------------------------------------------------------

(define congruent?
  (lambda (x y m)
    (equal? (remainder x m) (remainder y m))
    ))

(define addx
  (lambda (x C f?)
    (cond ((empty? C)
           (list (list x)))
          ((f? x (caar C))
           (cons (append (car C) (list x)) (cdr C)))
          (else
           (cons (car C) (addx x (cdr C) f?)))
          )))

(define f
  (lambda (x y)
    (congruent? x y 3)
    ))

(congruent? 6 8 2)
(congruent? 6 8 3)
(congruent? 16 28 3)
(newline)

(addx 1 '() f)
(addx 2 '((1)) f)
(addx 3 '((1) (2)) f)
(addx 4 '((1) (2) (3)) f)

(foldl
 (lambda (x A) (addx x A f))
 '()
 (range 12))

(foldl
 (lambda (x A)
   (addx x A (lambda (x y) (congruent? x y 3))))
 '()
 (range 12))
