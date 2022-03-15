; Используя функционалы:
; 1. Напишите функцию, которая уменьшает на 10 все числа из списка-аргумента этой
; функции.
(defun subtract_by_ten (lst)
    (mapcar #'(lambda (x) (- x 10)) lst)
)
(print "Задание 1")
(print (subtract_by_ten '(1 2 3 4)))

; 2. Напишите функцию, которая умножает на заданное число-аргумент все числа
; из заданного списка-аргумента, когда
; a) все элементы списка --- числа,
; б) элементы списка -- любые объекты.
(defun multiply_by_number_1 (lst number)
    (mapcar #'(lambda (x) (* x number)) lst)
)

(defun multiply_by_number_2 (lst number)
    (mapcar #'(lambda (x) (if (numberp x) (* x number) 
                              (if (listp x) 
                                  (multiply_by_number_1 x number) x)
                              )
              ) lst)
)

(print "Задание 2")
(print (multiply_by_number_1 '(1 2 3 4) 5))
(print (multiply_by_number_2 '(1 (2 2) 3 4) 5))


; 3. Написать функцию, которая по своему списку-аргументу lst определяет
; является ли он палиндромом (то есть равны ли lst и (reverse lst)).
(defun is_palindrom (lst)
    (let ((reverse_lst (reverse lst))
          (result nil)
         )
         (setq result (mapcar #'(lambda (x y) (equal x y)) lst reverse_lst))
         (every #'(lambda (x) (not (null x))) result)
    )
)
(print "Задание 3")
(print (is_palindrom '(1 2 (3 2) (2 1) 1)))

; 4. Написать предикат set-equal, который возвращает t, если два его множества-
; аргумента содержат одни и те же элементы, порядок которых не имеет значения.
(defun set_equal (lst1 lst2)
    (let ((result nil))
          (cond ((/= (length lst1) (length lst2)) nil)
                (T (setq result 
                         (maplist #'(lambda (x) (if (member (car x) lst2) T nil)) lst1)
                   )
                )
          )
          (cond ((not (null result)) (every #'(lambda (x) (eql x T)) result)))
    )
)

(print "Задание 4")
(print (set_equal '(2 3 4) '(3 2 4)))
; 5. Написать функцию которая получает как аргумент список чисел, а возвращает список
; квадратов этих чисел в том же порядке.
(defun square_numbers (lst)
    (mapcar #'(lambda (x) (* x x)) lst)
)
(print "Задание 5")
(print (square_numbers '(1 2 3)))

; 6. Напишите функцию, select-between, которая из списка-аргумента, содержащего только
; числа, выбирает только те, которые расположены между двумя указанными границами-
; аргументами и возвращает их в виде списка (упорядоченного по возрастанию списка чисел
; (+ 2 балла)).
(defun select_between (lst board_left board_right)
    (mapcan #'(lambda (x) 
               (and (>= x board_left) (<= x board_right) (list x)))
               lst)
)

(defun bubble (lst)
    (cond ((atom (cdr lst)) lst)
          ((> (car lst) (cadr lst)) 
           (cons (cadr lst) (bubble (cons (car lst) (cddr lst)) ))
          )
          (T lst)
    )
)

(defun bubble_sort_asc (lst)
    (cond ((atom (cdr lst)) lst)
          (T (bubble (cons (car lst) (bubble_sort_asc (cdr lst)))))
    )
)

(print "Задание 6")
(print (select_between '(7 0 8 3 10 18) 3 8))

; 7. Написать функцию, вычисляющую декартово произведение двух своих списков-
; аргументов. ( Напомним, что А х В это множество всевозможных пар (a b), где а
; принадлежит А, принадлежит В.)
(defun cartesian_product (lst1 lst2)
    (mapcan #'(lambda (x) (mapcar #'(lambda (y) (list x y)) lst2)) lst1)
)
(print "Задание 7")
(print (cartesian_product '(1 2 3) '(a b c)))
; 8. Почему так реализовано reduce, в чем причина?
; (reduce #'+0) -> 0
; (reduce #'+ ()) -> 0
; 9. Пусть list-of-list список, состоящий из списков. Написать функцию, которая вычисляет
; сумму длин всех элементов list-of-list, т.е. например для аргумента ((1 2) (3 4)) -> 4.
(defun list_of_list (lst)
    (reduce #'(lambda (count x) (+ count (length x))) (cons 0 lst))
)
(print "Задание 9")
(print (list_of_list '((1 2) (3 4))))
(print (list_of_list '((1 2) (5 (3 4)))))