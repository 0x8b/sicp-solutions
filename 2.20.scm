(define nil '())

(define (same-parity head . tail)
  (define (iter items)
    (if (null? items) nil
      (if (even? (+ (car items) head))
          (cons (car items) (iter (cdr items)))
          (iter (cdr items)))))

    (cons head (iter tail)))