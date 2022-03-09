;функция, которая возвращает последний элемент своего списка-аргумента
(defun last_elem_1 (arg) 
    (car (last arg)))
(print (last_elem_1 (list 1 5 35 35 63 33)))
(print (last_elem_1 (list 13)))

(defun last_elem_2 (arg) 
    (first (nreverse arg)))
(print (last_elem_2 (list 1 5 35 35 63 33)))
(print (last_elem_2 (list 13)))

;функция, которая возвращает свой список-аргумент без последнего элемента
(defun without_last_1 (arg) 
    (nreverse (cdr (nreverse arg))))
(print (without_last_1 (list 1 5 35 35 63 33)))
(print (without_last_1 (list 13)))

(defun without_last_2 (arg) 
    (reverse (last (nreverse arg) (- (length arg) 1))))
(print (without_last_2 (list 1 5 35 35 63 33)))
(print (without_last_2 (list 13)))


;Написать простой вариант игры в кости, в котором бросаются две правильные кости. Если
;сумма выпавших очков равна 7 или 11 -- выигрыш, если выпало (1,1) или (6,6) --- игрок
;право снова бросить кости, во всех остальных случаях ход переходит ко второму игроку, но
;запоминается сумма выпавших очков. Если второй игрок не выигрывает абсолютно, то
;выигрывает тот игрок, у которого больше очков. Результат игры и значения выпавших костей
;выводить на экран с помощью функции print.

(random 6) ;абсолютная победа первого игрока
(random 2372) ;абсолютная победа второго игрока
(random 130) ;победил второй игрок
(random 345) ;победа первого игрока

(defvar first_gamer nil)
(defvar second_gamer nil)

(defun roll_dice()
    (+ (random 6) 1))

(defun is_winner (first_gamer_numbers)
    (cond ((= (+ (car first_gamer_numbers) (cadr first_gamer_numbers)) 7) T)
          ((= (+ (car first_gamer_numbers) (cadr first_gamer_numbers)) 11) T)))

(defun is_new_move (first_gamer_numbers)
    (cond ((and (= (car first_gamer_numbers) 1) (= (cadr first_gamer_numbers) 1)) 'one)
          ((and (= (car first_gamer_numbers) 6) (= (cadr first_gamer_numbers) 6)) 'two)))

(defun print_gamer(gamer value_gamer)
    (print gamer)
    (print (car value_gamer))
)

(defun choose_winner()
    (or (if (> (+ (caar first_gamer) (cadar first_gamer)) 
           (+ (caar second_gamer) (cadar second_gamer)))
        (print_winner "Первый игрок победил" 1) (print_winner "Второй игрок победил" 1)
        )
        (print_winner "Ничья")
    )
)

(defun print_winner(str_win type_win)    
    (print "Игра_завершена")
    (print_gamer "Первый игрок" first_gamer)
    (if (null second_gamer) (print "Второй игрок не сделал ход.") (print_gamer "Второй игрок" second_gamer))
    (if (= 1 type_win) (print str_win) (choose_winner))
)

(defun user_round (gamer)
    (print "NEW_MOVE")
    (setq gamer (list (roll_dice) (roll_dice)))
    (cond ((is_winner gamer) (list gamer 1))
          ((is_new_move gamer) (user_round gamer))
          (T (list gamer 0)) 
    )
)

(defun play_game()
    (setq first_gamer (user_round first_gamer))
    (or (cond ((= 1 (cadr first_gamer)) (print_winner "Абсолютная победа первого игрока" 1)))
        (and (setq second_gamer (user_round second_gamer))
             (cond ((= 1 (cadr second_gamer)) (print_winner "Абсолютная победа второго игрока" 1)))
        )
        (choose_winner)
    )
)        

(play_game)