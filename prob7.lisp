(defun is-prime (x)
  (let ((r 1))
  (loop for i from 2 to (+ (isqrt x) 1)
        until (= (mod x i) 0)
        do
        (incf r))
  (= r (+ (isqrt x) 1))))

(defun find-prime (x)
  (let ((current-prime-idx 0)
        (r 0))
    (loop for i from 1
          until (= current-prime-idx x)
          do
          (if (is-prime i) (progn
                             (incf current-prime-idx)
                             (setq r i))))
    (+ r 0)))