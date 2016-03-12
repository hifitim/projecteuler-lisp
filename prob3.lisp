(defun prime-range (x n)
  (let ((n-sqrt (ceiling (sqrt n))))
    (cond ((> x n-sqrt) t)
          ((zerop (rem n x)) nil)
          (t (prime-range (+ x 1) n)))))

(defun prime-num-p (x)
  (prime-range 2 x))

(defun int-p (x)
  (= (- x (floor x)) 0))

(defun lpf-inner (x n n-sqrt)
  (let* ((x-div (/ n x)))
    (cond ((= x 1) 1) ; no prime factor available
          ((and (zerop (rem n x)) 
                (prime-num-p x))
           x) ; x is the first and largest prime factor
          ((and (int-p x-div)
                (prime-num-p x-div))
           x-div) ; x-div is the first and largest prime factor
          (t (lpf-inner (- x 2) n n-sqrt)))))

(defun largest-prime-factor (n)  
  (let* ((n-sqrt (ceiling (sqrt n))))
    (if (zerop (rem n-sqrt 2))
	  (incf n-sqrt))
    (lpf-inner n-sqrt n n-sqrt)))

;; Some large value test cases, with timing provided
;(time (largest-prime-factor 9007199254740993))
;(time (largest-prime-factor 907199254740993))
;(time (largest-prime-factor 600851475143))
