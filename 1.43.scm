(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i composition)
    (if (< i n)
        (iter (+ i 1) (compose f composition))
        composition))

  (iter 0 (lambda (x) x)))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

((repeated square 2) 5) ; 625
((repeated inc 10) 0) ; 10
((repeated cube 3) 2) ; 134217728
