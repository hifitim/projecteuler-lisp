(defun is-divisible-by-range (x div-lo div-hi)
  (let ((r -1))
    (loop for i from div-lo to div-hi
          until (not (= (mod x i) 0))
          do
          (setq r i))
    (= r div-hi)))

(defun smallest-multiple (div-lo div-hi)
  (let ((i 2))
  (loop while (not (is-divisible-by-range i div-lo div-hi))
        do (incf i))
  (format t "smallest multiple: ~a~%" i)))

(defun main ()
  (smallest-multiple 1 20))