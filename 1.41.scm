(define (double f)
  (lambda (x)
    (f (f x))))

((double inc) 0) ; 2

(((double (double double)) inc) 5) ; 21
