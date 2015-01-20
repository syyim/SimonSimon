;;;; CH8. Macros - Defining Your Own
;;;; Practical Common Lisp

;; do-primes
;; ex. calling
;; (do-primes (p 0 19)
;;   (format t "~d  " p))
;; -> 
;; (do ((p (next-prime 0) (next-prime (1+ p))
;;       ((> p 19))
;;   (format t "~d  " p))

; utility functions
(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep  n) return n))

;macro

(defmacro do-primes ((var start end) &body body)
  
