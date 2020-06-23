(import (scheme base))

(define nil '())

(define (deep-reverse items)
  (define (do-deep-reverse items reversed-items)
    (cond
      ((null? items) reversed-items)
      ((not (pair? items)) items)
      (else (do-deep-reverse (cdr items)
                             (cons (deep-reverse (car items))
                                   reversed-items)))))

  (do-deep-reverse items nil))