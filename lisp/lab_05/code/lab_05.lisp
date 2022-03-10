;1. функция, которая по своему списку-аргументу lst определяет, является ли он палиндромом.
(defun is_palindrom (lst) 
    (equal lst (reverse lst)))
(print (is_palindrom (list 3 8 5 8 3)))

;2. предикат set-equal, который возвращает t, если два его множества-аргумента
;содержат одни и те же элементы, порядок которых не имеет значения
; (defun set_equal (arg_1 arg_2)
;      (maplist #' (lambda (arg_1) (member (car arg_1) arg_2)) arg_2)
; )
; (print (set_equal (list 1 2 3) (list 3 4 1)))

;3. напишите свои необходимые функции, которые обрабатывают таблицу из 
;4-х точечных пар: (страна . столица), и возвращают по стране - столицу,
;а по столице — страну.

(defvar table)
(defvar capital)
(defvar country)
(setq table '((Russia . Moscow) (Ireland . Dublin) (Japan . Tokyo) (China . Pekin)))

(defun get_country (capital)
    (cond ((mapcar #'(lambda (x) (cond ((eq (cdr x) capital) (setq country (car x))))) table) country))
)

(defun get_capital (country)
    (cond ((mapcar #'(lambda (x) (cond ((eq (car x) country) (setq capital (cdr x))))) table) capital))
)

(print (get_country 'Tokyo))
(print (get_capital 'Japan))
(print (get_country 'Pekin))

;4. напишите функцию swap-first-last, которая переставляет в списке-аргументе
;первый и последний элементы.
(defun swap_first_last (lst)
    ;(print (last lst))
    ;(print (cons (cdr (nreverse (cdr (nreverse lst)))) (cons (car lst) nil)))
    (cons (car (last lst)) (nconc (cdr (nreverse (cdr (nreverse lst)))) (cons (car lst) nil)))
)
(print (swap_first_last (list 1 2 3 4)))
(print (swap_first_last (list 3 2 3 -4 8 -12)))

;5. Напишите функцию swap-two-element, которая переставляет в списке-аргументе
;два указанных своими порядковыми номерами элемента в этом списке.

;6. Напишите две функции, swap-to-left и swap-to-right, которые производят;
;одну круговую перестановку в списке-аргументе влево и вправо, соответственно}.

;7. Напишите функцию, которая добавляет к множеству двухэлементных списков новый
;двухэлементный список, если его там нет.

;8.Напишите функцию, которая умножает на заданное число-аргумент первый числовой
;элемент списка из заданного 3-х элементного списка-аргумента, когда
;a) все элементы списка --- числа,
;6) элементы списка -- любые объекты.

;9. Напишите функцию, select-between, которая из списка-аргумента из 5 чисел выбирает;
;только те, которые расположены между двумя указанными границами-аргументами и возвращает;
;их в виде списка (упорядоченного по возрастанию списка чисел).
