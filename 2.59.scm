(define (element-of-set? x s)
  (cond
    ((null? s) false)
    ((equal? x (car s)) true)
    (else (element-of-set? x (cdr s)))))

(define (union-set a b)
  (cond
    ((null? a) b)
    ((not (element-of-set? (car a) b))
     (union-set (cdr a) (cons (car a) b)))
    (else (union-set (cdr a) b))))