(defvar *even-sum* 2)
(setf *even-sum* 2)
(defvar *fib-list* '(2 1))
(setf *fib-list* '(2 1))

(defun sum-list (x)
  (cond ((null x) 0)
        ((+ (sum-list (cdr x)) (car x)))))

(defun even-fib-sum (x y)
  (format t "~D~%" x)
  (cond ((eq x y) t)
        ((> x y) t)
        ((evenp x) 
         (incf *even-sum* x)
         (push (sum-list (subseq *fib-list* 0 2)) *fib-list*)
         (even-fib-sum (sum-list (subseq *fib-list* 0 2)) y))
        (t
         (push (sum-list (subseq *fib-list* 0 2)) *fib-list*)
         (even-fib-sum (sum-list (subseq *fib-list* 0 2)) y))))

(even-fib-sum 1 4000000)
(format t "~D~%" *even-sum*)
