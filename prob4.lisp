(defun is-palindrome (str)
  (let ((r t))
  (loop for i from 0 below (length str)
      do
      (if (not (eq
            (aref str i)
            (aref str (- (- (length str) 1) i))))
          (setq r nil)))
  (and r t)))

(defun largest-palindrome (lo hi)
  (let ((largest -1)
        (product 0))
    (loop for i from lo to hi
          do
          (loop for j from lo to hi
                 do
                 (setq product (* i j))
                 (if (and (> product largest)
                          (is-palindrome (write-to-string product)))
                     (setq largest product))))
    (format t "~a~%" largest)))

(defun main ()
  (time (largest-palindrome 100 1000)))

