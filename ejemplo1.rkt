#lang racket

; ------------------------------------------------------
;
; (c) 2021 Georges Alfaro S.
;
; ------------------------------------------------------

(define s
  (lambda (L)
    (s-x L 0)
    ))

(define s-x
  (lambda (L R)
    (begin
      ; Muestra los parámetros de invocación de la función..
       (fprintf (current-output-port) "-> ~a, ~a~n" L R)
       (if (empty? L) R (s-x (cdr L) (+ R (car L))))
      )
    ))

(s '(4 5 6 7 1 2 3))
; -> (4 5 6 7 1 2 3), 0
; -> (5 6 7 1 2 3), 4
; -> (6 7 1 2 3), 9
; -> (7 1 2 3), 15
; -> (1 2 3), 22
; -> (2 3), 23
; -> (3), 25
; -> (), 28
; 28

(s-x '(4 5 6 7 1 2 3) 0)
(s-x '(4 5 6 7 1 2 3) 23)