#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-19
;
; https://docs.racket-lang.org/drracket/interactions-window.html
; https://docs.racket-lang.org/reference/input-and-output.html
; https://docs.racket-lang.org/guide/begin.html
;
; ------------------------------------------------------

; Lee valores desde el teclado y construye una lista
; con una cantidad especificada de elementos.

(define (g n) (g-x n 0 '()))

(define g-x
  (lambda (n i R)
    (cond ((< i n)
           (g-x n (+ i 1) (append R (list (read)))))
          (else
           R))
    ))

; Lee valores desde el teclado y construye una lista
; hasta encontrar un valor centinela (un número negativo).
; En este caso, la función principal no recibe ningún
; parámetro.

(define (g2)
  (g2-x (get-number) '()))

(define g2-x
  (lambda (x R)
    (cond ((< x 0) R)
          (else
           (g2-x (get-number) (append R (list x))))
          )))

(define get-number
  (lambda ()
    (begin
      (display "Digite un número: ")
      (read)
      )
    ))
