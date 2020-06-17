(define (<= a b)
  (or (< a b) (= a b)))

(define (cont-frac n d k)
  (define (iter i)
    (if (<= i k)
        (/ (n i)
           (+ (d i) (iter (+ i 1))))
        0))

  (iter 1))

(define (euler k)
  (+ 2 (cont-frac (lambda (i) 1.0)
                  (lambda (i) (if (= 0 (remainder (- i 2) 3)) (+ 2 (* 2 (quotient i 3))) 1))
                  k)))

(euler 30) ; 2.7182818284590455
