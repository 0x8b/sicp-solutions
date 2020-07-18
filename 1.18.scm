(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* x y)
  (define (iter x y a)
    (cond
      ((= y 0) a)
      ((even? y) (iter (double x) (halve y) a))
      (else (iter x (- y 1) (+ x a)))))

  (iter a b 0))