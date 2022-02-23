(defun hypotenuse (cath1 cath2) (sqrt (+ (* cath1 cath1) (* cath2 cath2))))

(print(hypotenuse 12 9))

(defun volume (side1 side2 side3) (* side1 side2 side3))

(print (volume 2 3 4))

(defun longer_then (arg1 arg2) (>= (length arg1) (length arg2)))

(print (longer_then '(3 5) '(2 3 4 5)))

(defun mystery (x) (list (second x) (first x)))

(print (mystery (one two)))