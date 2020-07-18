(define (adjoin-set x s)
  (cond
    ((null? s) (list x))
    ((< x (car s)) (cons x s))
    ((> x (car s)) (cons (car s) (adjoin-set x (cdr s))))
    (else s)))