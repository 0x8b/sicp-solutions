(define (reverse list)
  (define (do-reverse list reversed-list)
    (if (null? list)
        reversed-list
        (do-reverse (cdr list) (cons (car list) reversed-list))))

  (do-reverse list nil))