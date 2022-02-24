(defun hypotenuse (cath1 cath2) (sqrt (+ (* cath1 cath1) (* cath2 cath2))))

(print(hypotenuse 12 9))

(defun volume (side1 side2 side3) (* side1 side2 side3))

(print (volume 2 3 4))

(defun longer_then (arg1 arg2) (>= (length arg1) (length arg2)))

(print (longer_then '(3 5) '(2 3 4 5)))

(defun mystery (x) (list (second x) (first x)))

;(print (mystery (one two)))

(defun f_to_c (temp) (* (/ 5 9) (- temp 32.0)))
(defun c_to_f (temp) (+ (* (/ 9 5) temp) 32.0))

(print (f_to_c 451))
(print (c_to_f 0))

(defun hypo_cath (hypo cath) (sqrt (- (* hypo hypo) (* cath cath))))

(print (hypo_cath 15 12))

(defun trapezoid_square (base1 base2 height) (* 0.5 (+ base1 base2) height))

(print (trapezoid_square 3 5 2))

(print (eval (list 'cons T NIL)))
