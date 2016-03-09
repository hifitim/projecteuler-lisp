(defun prime-range (x n)
  (let ((n-sqrt (ceiling (sqrt n))))
    (cond ((> x n-sqrt) t)
          ((eq (rem n x) 0) nil)
          (t (prime-range (incf x) n)))))

(defun prime-num-p (x)
  (prime-range 2 x))

(defun int-p (x)
  (= (- x (floor x)) 0))

(defun lpf-inner (x n n-sqrt)
  (let* ((x-div (/ n x)))
    (cond ((eq 1 x) 1) ; no prime factor available
          ((and (eq (rem n x) 0) 
                (prime-num-p x))
           x) ; x is the first and largest prime factor
          ((and (int-p x-div)
                (> x-div x) 
                (eq (rem n x-div) 0) 
                (prime-num-p x-div))
           x-div) ; x-div is the first and largest prime factor
          (t (lpf-inner (decf x) n n-sqrt)))))

(defun largest-prime-factor (n)  
  (let* ((n-sqrt (ceiling (sqrt n))))
    (lpf-inner n-sqrt n n-sqrt)))
