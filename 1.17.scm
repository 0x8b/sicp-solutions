(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (multiply a b)
  (if (= b 0)
      0
      (if (even? b)
          (multiply (double a) (halve b))
          (+ a (multiply a (- b 1))))))
