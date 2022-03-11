;1. функция, которая по своему списку-аргументу lst определяет, является ли он палиндромом.
(defun is_palindrom (lst) 
    (equal lst (reverse lst)))
(print "Задание_1")
(print (is_palindrom (list 3 8 5 8 3)))

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

(defun set_equal (set_1 set_2)
    (if (= (length set_1) (length set_2)) (is_equal_set set_1 set_2) 'Ошибка)
)
(print "Задание_2")
(print (set_equal (list 1 2 4) (list 3 2 1)))

;3. напишите свои необходимые функции, которые обрабатывают таблицу из 
;4-х точечных пар: (страна . столица), и возвращают по стране - столицу,
;а по столице — страну.

(defvar table)
(setq table '((Russia . Moscow) (Ireland . Dublin) (Japan . Tokyo) (China . Pekin)))

(defun get_country (capital)
    (let ((country 0))
        (cond ((mapcar #'(lambda (x) (cond ((eq (cdr x) capital) (setq country (car x))))) table) 
                    country)
        )
    )
)

(defun get_capital (country)
    (let ((capital 0))
        (cond ((mapcar #'(lambda (x) (cond ((eq (car x) country) (setq capital (cdr x))))) table) capital))
    )
)

(print "Задание_3")
(print (get_country 'Tokyo))
(print (get_capital 'Japan))
(print (get_country 'Pekin))

;4. напишите функцию swap-first-last, которая переставляет в списке-аргументе
;первый и последний элементы.
(defun swap_first_last (lst)
    (cons (car (last lst)) (nconc (cdr (nreverse (cdr (nreverse lst)))) (cons (car lst) nil)))
)
(print "Задание_4")
(print (swap_first_last '(1 2 3 4)))
(print (swap_first_last '(3 2 3 -4 8 -12)))
(print (swap_first_last (list 3 2 3 -4 (list 8 -12))))

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

;8.Напишите функцию, которая умножает на заданное число-аргумент первый числовой
;элемент списка из заданного 3-х элементного списка-аргумента, когда
;a) все элементы списка --- числа,
;6) элементы списка -- любые объекты.

;9. Напишите функцию, select-between, которая из списка-аргумента из 5 чисел выбирает;
;только те, которые расположены между двумя указанными границами-аргументами и возвращает;
;их в виде списка (упорядоченного по возрастанию списка чисел).
