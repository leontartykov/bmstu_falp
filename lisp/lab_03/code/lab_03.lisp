;1. функция, которая принимает целое число и возвращает первое
;четное число, не меньшее аргумента
(defun first_even (number) (if (evenp number) number (+ number 1)))
(print (first_even 4))

;2. функция, которая принимает число и возвращает число того же
;знака, но с модулем на 1 больше модуля аргумента

(defun abs_more (number)
        (cond ((>= number 0) (+ number 1))
               (T (- (+ (abs number) 1)))))
(print (abs_more 0))

;3. функция, которая принимает два числа и возвращает список
;из этих чисел, расположенный по возрастанию
(defun inc_list (number_1 number_2) 
    (if (<= number_1 number_2) (list number_1 number_2) (list number_2 number_1)))
(print (inc_list 2 4))

;4. функция, которая принимает три числа и возвращает T только
;тогда, когда первое число расположено между вторым и третьим
(defun is_middle_cond_new (number_1 number_2 number_3)
    (cond ((> number_1 number_2) (cond ((< number_1 number_3) T)))
          ((< number_1 number_2) (cond ((> number_1 number_3) T)))
    )
)
(print (is_middle_cond_new 4 2 6))
(print (is_middle_cond_new 4 6 2))

(defun is_middle_if (number_1 number_2 number_3)
    (if (and (> number_1 number_2) (< number_1 number_3)) T nil))

(defun is_middle_andor (number_1 number_2 number_3)
    (or (and (> number_1 number_2) (< number_1 number_3))
        (and (> number_1 number_2) (< number_1 number_3))
    )
)


(print (is_middle_if 4 2 5))
(print (is_middle_andor 2 4 5))




;5. предикат, который принимает два числа-аргумента и возвращает T,
;если первое число не меньше второго.
(defun is_bigger (number_1 number_2)
    (if (>= number_1 number_2) T nil))
(print (is_bigger -1 -5))

;6. переписанная функция how_alike
;how_alike cond
(defun how_alike(x y)
    (cond ((or (= x y) (equal x y)) 'the_same)
    ((and (oddp x) (oddp y)) 'both_odd)
    ((and (evenp x) (evenp y)) 'both_even)
    (t 'difference) ))



;how_alike if, and/or
(defun how_alike_if_andor(x y)
    (if (or (= x y) (equal x y)) 'the_same
        (if (and (oddp x) (oddp y)) 'both_odd 
            (if (and (evenp x) (evenp y)) 'both_even 'difference))))
(print (how_alike_if_andor -3 2))
(print (how_alike_if_andor 4 2))
(print (how_alike_if_andor 1 1))
(print (how_alike_if_andor 5 7))

;how_alike if
(defun how_alike_if (x y)
    (if (if (= x y) (equal x y)) 'the_same
        (if (if (oddp x) (oddp y)) 'both_odd
            (if (if (evenp x) (evenp y)) 'both_even 'difference)))) 
            
(print (how_alike_if -3 2))
(print (how_alike_if 4 2))
(print (how_alike_if 1 1))
(print (how_alike_if 5 7))

;how_alike and/or
(defun how_alike_andor (x y)
    (or (and (= x y) (equal x y) 'the_same) 
        (and (oddp x) (oddp y) 'both_odd)
        (and (evenp x) (evenp y) 'both_even)
        'difference))

(print (how_alike_if -3 2))
(print (how_alike_if 4 2))
(print (how_alike_if 1 1))
(print (how_alike_if 5 7))

(defun how_alike_cond (x y)
    (cond ((= x y) (cond ((equal x y) 'the_same)))
          ((oddp x) (cond ((oddp y) 'both_odd) (T 'difference)))
          ((evenp x) (cond ((evenp y) 'both_even) (T 'difference)))
          ('difference)
    )
)
(print (how_alike_cond 1 1))
(print (how_alike_cond 4 2))
(print (how_alike_cond 5 7))
(print (how_alike_cond -3 2))
(print (how_alike_cond -2 3))



