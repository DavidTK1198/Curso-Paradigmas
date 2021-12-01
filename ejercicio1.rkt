#lang racket
; ======================================================
;
; Nombre: Daniel Barrientos Araya
; cédula: 1-1725-0610
; 2021-11-27
; EIF400 – Paradigmas de Programación – NRC 50043
;
; ======================================================

(define (invertir-x n xs);recibe la lista y la posición donde se desea invertir
  (if (<= n 0);en este caso primero recorre la lista hasta el elemento N
    '();para retornar el segmento invertido de la lista
    (append (invertir-x (- n 1) (rest xs)) (list (first xs)))))

  (define (invertir-y n L);recibe la lista y la posición donde se desea invertir
      (if (<= n 0);en este caso avanza hasta la posición donde se encuentra el elemento a invertir
        L;ignora todo ese segmento y devuelve la lista sin los primeros N elementos
        (invertir-y (- n 1) (cdr L) )))

(define (invertir n L);recibe la lista y la posición a invertir
      (if (> n (length L));en este caso el invertir se apoya en 2 funciones
             L;la primera devuelve el segmento invertido y la segunda el resto de la lista
       (append (invertir-x n L) (invertir-y n L) )))

(define (ordenar-x L);Esta función recorre la lista y utiliza la función invertir en base a un criterio
  (if (empty? L);la función va construyendo la nueva lista invertida en cada recursión
      L         ;en este caso se elegio el criterio de ordenar la lista desde el número más grande
     (cons (car (invertir;por lo cual se realiza un fold con una función lambda para encontrar el valor más grande
        (+ (index-of L (foldl (lambda (x y) (if (>  x y)  x y)) 0 L)) 1) L));en cada llamado de la función
        (ordenar-x (cdr (invertir;Una vez que se encontro el valor más grande se utiliza el index-of para calcular
        (+ (index-of L (foldl (lambda (x y) (if (>  x y)  x y)) 0 L)) 1) L))))));el N que utiliza la función invertir
         ;como se puede notar se calcula 2 veces la lista invertida, ya que se pierde el valor y es necesario eliminar
         ;el termino mayor en cada recursión, si no existirían terminos repetidos
         ;como se nota no es un algoritmo muy eficiente pero se cumple con el objetivo
         ;tal vez se podría cambiar las funciones invertir y unificarlas por medio de lambda, pero no me siento comodo
         ;al hacer la recursión

(define (ordenar L);recibe la lista invertir
  (invertir (length L) (ordenar-x L)));Como esta lista se ordena utilizando los terminos mayores
                                      ;se debe invertir una última vez para alcanzar el resultado deseado

(display "Ordenando la lista...")
(newline)
(ordenar '(9 2 5 19 3 4 20 13 17 7 18 16 1 11 10 6 8 15 12 14))
