(define (same-parity . list)
  (let ((parity-of-first (remainder (car list) 2)))
    (define (iter list)
      (if (null? list) nil
          (let ((head (car list))
                (tail (cdr list)))
            (if (= parity-of-first (remainder head 2))
                (cons head (iter tail))
                (iter tail)))))

    (iter list)))