(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))

  (iter a 0))

(define (identity x) x)

(define (cube x)
  (* x x x))

(sum identity 0 inc 10) ; 55
(sum cube 0 inc 10) ; 3025
