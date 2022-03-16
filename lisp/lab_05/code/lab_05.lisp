;1. функция, которая по своему списку-аргументу lst определяет, является ли он палиндромом.
(defun is_palindrom_1 (lst) 
    (equal lst (reverse lst)))

(defun is_palindrom_2 (lst)
    (is_equal_2 lst (my_reverse lst))
)

(defun is_equal_1 (lst reverse_lst)
    (cond ((null lst) T)
          ((and (numberp (car lst)) (numberp (car reverse_lst))) (is_equal_numbers lst reverse_lst))
          ((and (listp (car lst)) (listp (car reverse_lst))) (is_equal_1 (car lst) (car reverse_lst)))
    ) 
)

(defun is_equal_2 (lst reverse_lst)
    (cond ((null lst) T)
          ((= (car lst) (car reverse_lst)) (is_equal_2 (cdr lst) (cdr reverse_lst)))
    ) 
)

(defun move_to (lst result)
    (cond ((null lst) result)
	       (T (move_to (cdr lst) (cons (car lst) result)))))

(defun my_reverse (lst)
    (move_to lst ()))

(defun is_equal_numbers (lst reverse_lst)
    (if (= (car lst) (car reverse_lst)) (is_equal (cdr lst) (cdr reverse_lst)) nil)
)

(print "Задание_1")
(print (is_palindrom_1 '(3 8 5 8 3)))
(print (is_palindrom_2 '(3 5 3 4 3 5 3)))

;2. предикат set-equal, который возвращает t, если два его множества-аргумента
;содержат одни и те же элементы, порядок которых не имеет значения
; (defun set_equal (arg_1 arg_2)
;     (cond ((eq  (car (mapcar #'print (mapcar #'(lambda (x) (cond ((not (member x arg_2)) (list T) )) ) arg_1 ) )) T) 'not_equal) )

; )

(defun is_elem_in_set (elem set)
    (cond ((null set) nil)
          ((= elem (car set)) T)
          (T (is_elem_in_set elem (cdr set)))
    )
)

(defun is_equal_set (set_1 set_2)
    (cond ((null set_1))
          ((is_elem_in_set (car set_1) set_2) (is_equal_set (cdr set_1) set_2))
          (T nil)
    )
)

(defun is_set (set)
    (cond ((null set) T)
          ((eql (is_double_in_set set) 0) (is_set (cdr set)))
    )
)

(defun is_double_in_set (set)
    (if (member (car set) (cdr set)) 1 0)
)

(defun set_equal (set_1 set_2)
    (cond ((not (is_set set_1)) nil)
          ((not (is_set set_2)) nil)
          ((not (= (length set_1) (length set_2))) nil) 
          ((is_equal_set set_1 set_2) T)
    )
)
(print "Задание_2")
;(print (is_set '(1 2 3 4 1 5)))
(print (set_equal '(1 2 1) '(3 2 1)))

;3. напишите свои необходимые функции, которые обрабатывают таблицу из 
;4-х точечных пар: (страна . столица), и возвращают по стране - столицу,
;а по столице — страну.

(defvar table)
(setq table '((Russia . Moscow) (Ireland . Dublin) (Japan . Tokyo) (China . Pekin)))

(defun get_country (table capital)
    (cond ((null table) nil)
          ((eq (cdar table) capital) (caar table))
          (T (get_country (cdr table) capital))
    )
    ; (let ((country 0))
    ;     (cond ((mapcar #'(lambda (x) (cond ((eq (cdr x) capital) (setq country (car x))))) table) 
    ;                 country)
    ;     )
    ; )
)

(defun get_capital (table country)
    (cond ((null table) nil)
          ((eq (caar table) country) (cdar table))
          (T (get_capital (cdr table) country))
    )
)

(print "Задание_3")
(print (get_country '((Russia . Moscow) (Ireland . Dublin) (Japan . Tokyo) (China . Pekin))
                   'Tokyo))
(print (get_capital '((Russia . Moscow) (Ireland . Dublin) (Japan . Tokyo) (China . Pekin))
                    'Japan))
;(print (get_country 'Pekin))

;4. напишите функцию swap-first-last, которая переставляет в списке-аргументе
;первый и последний элементы.
(defun swap_first_last (lst)
    (cons (car (last lst)) (nconc (cdr (nreverse (cdr (nreverse lst)))) (cons (car lst) nil)))
)
(print "Задание_4")
(print (swap_first_last '(1 2 3 4)))
(print (swap_first_last '(3 2 3 -4 8 -12)))
(print (swap_first_last '(3 2 3 -4 (8 -12))))

;5. Напишите функцию swap-two-element, которая переставляет в списке-аргументе
;два указанных своими порядковыми номерами элемента в этом списке.
;приходится выбирать из двух зол меньшее: либо загружать рекурсию аргументами, либо глобальные переменные
(defvar first_elem)
(defvar second_elem)

(defun append_elem (lst index index_1 index_2)
    (print lst)
    (cond ((null lst) nil)
          ((= index index_1) (cons second_elem (append_elem (cdr lst) (+ index 1) index_1 index_2)))
          ((= index index_2) (cons first_elem (append_elem (cdr lst) (+ index 1) index_1 index_2)))
          (T (cons (car lst) (append_elem (cdr lst) (+ index 1) index_1 index_2)))
    )
)

(defun swap_two_elements (lst index_1 index_2)
    (setq first_elem (nth index_1 lst))
    (setq second_elem (nth index_2 lst))
    (print first_elem)
    (print second_elem)
    (let ((len_lst (length lst))
          (index 0))
         (cond ((or (< index_1 0) (> index_1 len_lst)) "Некорректный размер")
               ((or (< index_2 0) (> index_2 len_lst)) "Некорректный размер")
               ((>= index_1 index_2) "Некорректный размер")
               (T (append_elem lst 0 index_1 index_2))
         )
         
    )
)
(print "Задание_5")
(print (swap_two_elements '(1 5 3) 0 2))
(print (swap_two_elements '(1 5 3 (1 2) 5 7) 3 5))

;6. Напишите две функции, swap-to-left и swap-to-right, которые производят;
;одну круговую перестановку в списке-аргументе влево и вправо, соответственно}.

(defun without_last (lst)
    (nreverse (cdr (nreverse lst)))
)

(defun swap_to_right (lst)
    (cons (car (last lst)) (without_last lst))
)

(defun swap_to_left (lst)
    (nconc (cdr lst) (cons (car lst) nil))
)

(print "Задание_6")
(print (swap_to_right '(1 2 3 4)))
(print (swap_to_left '(1 2 3 4)))

;7. Напишите функцию, которая добавляет к множеству двухэлементных списков новый
;двухэлементный список, если его там нет.
(defun check_lists_in_set (set_lists)
    (cond ((null set_lists) T)
          ((not (listp (car set_lists))) nil)
          ((if (= 2 (length (car set_lists))) (check_lists_in_set (cdr set_lists)) nil))
    )
)

(defun is_in_set (new_list set_lists)
    (cond ((null set_lists) T)
          ((not (equal new_list (car set_lists))) (is_in_set new_list (cdr set_lists)) )
    )
)

(defun append_new_elem (new_list set_lists)
    (cond ((not (listp new_list)) "Ошибка")
          ((not (listp set_lists)) "Ошибка")
          ((not (check_lists_in_set set_lists)) "Ошибка")
          ((is_in_set new_list set_lists) (nconc set_lists `(,new_list)))
          (T set_lists)
    )
)
(print "Задание_7")
(print (append_new_elem '(1 2) '((1 2) (3 4) 4)))
(print (append_new_elem '(1 2) '((1 2) (3 4) (4 5))))
(print (append_new_elem '(3 5) '((1 2) (3 4) (4 5))))

;8.Напишите функцию, которая умножает на заданное число-аргумент первый числовой
;элемент списка из заданного 3-х элементного списка-аргумента, когда
;a) все элементы списка --- числа,
;6) элементы списка -- любые объекты.
(defun multiply_var_1 (lst number)
    (cond ((null lst) nil)
          (T (cons (* number (car lst)) (cdr lst)))
    )
)

(defun multiply_var_2 (lst number)
    (cond ((null lst) nil)
          (T (if (numberp (car lst))
                 (cons (* number (car lst)) (cdr lst)) 
                 (cons (car lst) (multiply_var_2 (cdr lst) number)))
          )
    )
)

(defun check_lst (lst number)
    (cond ((not (numberp number)) nil)
          ((not (listp lst)) nil)
          ((not (= 3 (length lst))) nil)
          (T T)
    )
)

(defun multiply_list_by_number_1 (lst number)
    (cond ((check_lst lst number) (multiply_var_1 lst number)))
)

(defun multiply_list_by_number_2 (lst number)
    (if (check_lst lst number) (multiply_var_2 lst number) "Ошибка")
)

(print "Задание 8")
(print (multiply_list_by_number_2 '(1 2 3) 5))
(print (multiply_list_by_number_2 '((1 2) 2 3) 5))
(print (multiply_list_by_number_2 '((1 2) (2) 3) 5))

;9. Напишите функцию, select-between, которая из списка-аргумента из 5 чисел выбирает
;только те, которые расположены между двумя указанными границами-аргументами и возвращает
;их в виде списка (упорядоченного по возрастанию списка чисел).
(defun select_between_1 (lst board_left board_right)
    (let ((result_lst nil))
         (setq result_lst (if (check_input_data lst board_left board_right) 
                          (find_left_board lst board_left board_right 0) 
                          nil
                          )
         )
         (if (not (null result_lst)) (bubble_sort_asc result_lst) "Ошибка")
    )
)

(defun check_input_data (lst board_left board_right)
    (cond ((not (= (length lst) 5)) nil)
          ((< board_left 0) nil)
          ((>= board_right 5) nil)
          ((<= board_right board_left) nil)
          (T T)
    )
)

(defun find_left_board (lst board_left board_right index_board)
    (if (= index_board board_left) 
        (find_right_board (cdr lst) board_right (+ index_board 1))
        (find_left_board (cdr lst) board_left board_right (+ index_board 1))   
    )
)

(defun find_right_board (lst board_right index_board)
    (if (= index_board board_right)
        (cons (car lst) nil) 
        (cons (car lst) (find_right_board (cdr lst) board_right (+ index_board 1)))
    )
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

(defun select (lst board_left board_right)
    (cond ((null lst) nil)
          ((and (>= (car lst) board_left) (<= (car lst) board_right)) 
           (cons (car lst) (select (cdr lst) board_left board_right))
          )
          (T (select (cdr lst) board_left board_right))
    )
)

(defun select_between_2 (lst board_left board_right)
    (bubble_sort_asc (select lst board_left board_right))

)

(print "Задание 9")
;(print (select_between_1 '(1 2 6 2 5) 1 4))
(print (select_between_2 '(7 0 8 3 10 18) 3 8))
;(print (bubble_sort_asc '(5 4 3 2 1)))
;(print (bubble '(5 4 3 2 1)))
;(print (bubble_sort_asc '(5 4 3 2 1)))