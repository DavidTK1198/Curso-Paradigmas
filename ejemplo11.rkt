#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-22
;
; ------------------------------------------------------

(define addx
  (lambda (x C f?)
    (cond ((empty? C)
           (list (list x)))
          ((f? x (caar C))
           (cons (append (car C) (list x)) (cdr C)))
          (else
           (cons (car C) (addx x (cdr C) f?)))
          )))

(define clasificar
  (lambda (f? L)
    (foldl (lambda (x A) (addx x A f?)) '() L)
    ))

; ------------------------------------------------------------

(define personas
  '(("Jorge" "Alfaro")
    ("Carmen" "Benavides")
    ("Andrea" "Rodríguez")
    ("Luis" "Alfaro")
    ("Adriana" "Alfaro")
    ("Carlos" "Rodríguez")))

(clasificar (lambda (x y) (equal? (cadr x) (cadr y))) personas)

