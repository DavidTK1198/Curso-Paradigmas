#lang racket

; ------------------------------------------------------
;
; (c) 2021
; Georges Alfaro S.
; version 1.0.0 2021-10-20
;
; ------------------------------------------------------

(define factorial ; Función recursiva de PILA (stack recursive)
  (lambda (n)
    (if (zero? n) 1 ; caso base (trivial)
        (* n (factorial (- n 1))))
    ))

(define f1
  (lambda (n)
    (f1-x n 1)
    ))

(define f1-x ; Función recursiva de COLA (tail recursive)
  (lambda (n R)
    (if (zero? n) R
        (f1-x (- n 1) (* n R)))
    ))

; ------------------------------------------------------

(define f2
  (lambda (n)
    (f2-x n 0 1)
    ))

; Calcula el valor del factorial de n Corecursivamente.
; Observe que la versión recursiva de cola (f1) no cuenta
; con ninguno de los valores intermedios del cálculo.
; Una función corecursiva opera en sentido inverso a la
; versión recursiva, iniciando desde el caso base.
; En cada paso recursivo, la función utiliza cada valor
; para obtener el siguiente.
; Note que desde la versión recursiva NO es posible mostrar
; los valores intermedios de la secuencia como se hace aquí.
; El valor de i es un parámetro de control, que sirve para
; detener la evaluación luego de calcular el n-ésimo
; término de la secuencia.

(define f2-x ; Función corecursiva
  (lambda (m i F)
    (begin
      (fprintf (current-output-port) "f(~a) = ~a~n" i F)
      (if (>= i m) F (f2-x m (+ i 1) (* (+ i 1) F)))
    )
    ))

; ------------------------------------------------------

(factorial 20)
(f1 20)
(f2 20)
(newline)

(map factorial (range 12))
(map f1 (range 12))
(newline)

(foldl * 1 (range 1 100 3)) ; metamorfismo
