#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-20
;
; ------------------------------------------------------

(define get-list
  (lambda (in)
    (get-list-x in (read in) '())
    ))

; Lee un conjunto de números enteros desde un archivo de
; texto, agregándolos a una lista hasta que se de una
; condición de fin de archivo (también podría emplearse
; un valor centinela).

(define get-list-x
  (lambda (in x R)
    (if (eof-object? x) R
        (get-list-x in (read in) (append R (list x))))
    ))

((lambda (f)
   (get-list (open-input-file f))) "lista1.txt")

; ------------------------------------------------------

; Lee una lista de valores enteros desde un archivo, que
; contiene la representación textual de la lista.

(read (open-input-file "lista2.txt"))

; Lee una lista de valores desde la consola.
; (get-list (current-input-port))
