(define (element-of-set? x s)
  (cond
    ((null? s) false)
    ((equal? x (car s)) true)
    (else (element-of-set? x (cdr s)))))

(define (adjoin-set x s)
  (cons x s))

(define (union-set a b)
  (append a b))

(define (intersection-set a b)
  (cond
    ((or (null? a) (null? b)) '())
    ((element-of-set? (car a) b) (cons (car a) (intersection-set (cdr a) b)))
    (else (intersection-set (cdr a) b))))