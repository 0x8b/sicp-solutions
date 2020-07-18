(define (square x)
  (* x x))

(define (halve x)
  (/ x 2))

(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond
      ((= n 0) a)
      ((even? n) (fast-expt-iter (square b) (halve n) a))
      (else (fast-expt-iter b (- n 1) (* b a)))))

  (fast-expt-iter b n 1))