(define (square a)
  (* a a))

(define (halve a)
  (/ a 2))

(define (fast-expt b n)
  (define (fast-expt-iter b n product)
    (if (= n 0)
        product
        (if (even? n)
            (fast-expt-iter (square b) (halve n) product)
            (fast-expt-iter b (dec n) (* b product)))))

  (fast-expt-iter b n 1))
