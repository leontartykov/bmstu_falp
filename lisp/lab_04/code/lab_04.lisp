;функция, которая возвращает последний элемент своего списка-аргумента
(defun last_elem_1 (arg) (car (last arg)))
(print (last_elem_1 (list 1 5 35 35 63 33)))
(print (last_elem_1 (list 13)))

(defun last_elem_2 (arg) (first (reverse arg)))
(print (last_elem_2 (list 1 5 35 35 63 33)))
(print (last_elem_2 (list 13)))

;функция, которая возвращает свой список-аргумент без последнего элемента
(defun without_last_1 (arg) (reverse (cdr (reverse arg))))
(print (without_last_1 (list 1 5 35 35 63 33)))
(print (without_last_1 (list 13)))

;(defun without_last_2 (arg) (reverse (cdr (reverse arg))))
;(print (without_last_2 (list 1 5 35 35 63 33)))
;(print (without_last_2 (list 13)))

(defun is_winner (number_1 number_2) 
    (cond ((= (+ number_1 number_2) 7) 'Winner)
          ((= (+ number_1 number_2) 11) 'Winner)))
(print (is_winner 5 6))