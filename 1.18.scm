(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (multiply a b)
  (define (multiply-iter a b sum)
    (if (= b 0)
        sum
        (if (even? b)
            (multiply-iter (double a) (halve b) sum)
            (multiply-iter a (- b 1) (+ a sum)))))

  (multiply-iter a b 0))
