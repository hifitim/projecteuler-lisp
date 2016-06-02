(defun sum-of-squares (lo hi)
  (loop for i from lo to hi
        sum (expt i 2)
        ))

(defun square-of-sums (lo hi)
  (expt (loop for i from lo to hi
              sum i) 2))

(defun diff-sum-squares (lo hi)
  (- (square-of-sums lo hi) (sum-of-squares lo hi)))

(defun main ()
  (diff-sum-squares 1 100))