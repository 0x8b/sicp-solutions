(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (extract-exponent base n)
  (if (= 0 (remainder n base))
      (+ 1 (extract-exponent base (/ n base)))
      0))

(define (car n)
  (extract-exponent 2 n))

(define (cdr n)
  (extract-exponent 3 n))

; test
(define c (cons 6 5))
(car c) ; 6
(cdr c) ; 5