(define f
  (let ((first '()))
    (lambda (n)
      (if (null? first)
          (begin (set! first n)
                 first)
          0))))

(+ (f 0) (f 1))