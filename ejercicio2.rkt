#lang racket
; ======================================================
;
; Nombre: Daniel Barrientos Araya
; cédula: 1-1725-0610
; 2021-11-27
; EIF400 – Paradigmas de Programación – NRC 50043
;
; ======================================================
(define empleados
 '(
 (juan 150000)
 (pedro 250000)
 (marta 350000)
 (adriana 300000)
 (carlos 175000)
 (valeria 275000)
 )
 )

(display "Empleados con cargas sociales")
(newline);se utiliza la función map, la cual recibe una función lambda encargada de realizar el calculo de cargas sociales
(map (lambda (x) (append x (list (+ 0.0 (* (cadr x) (/ 9 100) )) ))) empleados);agrega a cada elemento de la lista
                                                                               ;el valor correspondiente
(display "------------------------------------------")
(newline)
(display "Empleados que ganan más de 280 000")
(newline)
;se utiliza la función map, la cual recibe una función lambda encargada de realizar un filtrado y devolver los nombres
;de los empleados que ganan más de 280 000
 (map (lambda (x)  (car x) ) (filter(lambda (x) (> (cadr x) 280000)) empleados))
(display "------------------------------------------")
(newline)
(display "El total de los salarios de todos los empleados que ganan menos de 280,000.")
(newline)
;se utiliza la apply, la cual utiliza la función suma  en una lista obtenida por medio de la
;función map, la cual recibe una función lambda encargada de realizar un filtrado de los empleados que ganan menos  que  de 280 000
;la lista obtenida solo posee el segundo elemento el cual corresponde al dinero
(apply + (map (lambda (x)  (cadr x) ) (filter(lambda (x) (< (cadr x) 280000)) empleados)))
(display "------------------------------------------")
(newline)
(display "Los salarios mínimo y máximo para todos los empleados.")
(newline)
;Crea una lista con los valores minimos y maximos de cada empleados
(list  (foldl (lambda (x y) (if (< (cadr x) y) (cadr x) y))              ;primero se utiliza foldl el cual recibe una función lambda
   (foldl (lambda (x y) (if (> (cadr x) y) (cadr x) y)) 0 empleados) empleados);que es la encargada de obtener el valor máximo de esa lista
       (foldl (lambda (x y) (if (> (cadr x) y) (cadr x) y)) 0 empleados));en el caso del valor minimo se utiliza foldl
                                                                   ;el cual recibe una función lambda encargada de encontrar el valor minimo de la lista
                                                                 ;en este caso es más elaborado, se puede notar que primero encuentra el valor máximo
                                                                 ; y una vez obtenido ese valor máximo se busca el valor minimo de la lista
                                                                 ;por lo cual se puede observar como se vuelve a calcular el valor máximo de
                                                                 ;la lista
       