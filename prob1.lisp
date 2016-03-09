(defvar *sum* 0)
(setf *sum* 0)

(defun fizzbuzz (x y)
  (cond 
    ((= x y) t)
    ((eq (rem x 3) 0)      
     (incf *sum* x)
     (fizzbuzz (+ x 1) y))
    ((eq (rem x 5) 0)     
     (incf *sum* x)
     (fizzbuzz (+ x 1) y))
    (t      
      (fizzbuzz (+ x 1) y))))

(fizzbuzz 1 1000)
(format t "Total: ~D~%" *sum*)
