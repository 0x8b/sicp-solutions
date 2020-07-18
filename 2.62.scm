(define (union-set a b)
  (cond
    ((null? a) b)
    ((null? b) a)
    (else (let ((ha (car a))
                (ta (cdr a))
                (hb (car b))
                (tb (cdr b)))
      (cond
        ((= ha hb) (cons ha (union-set ta tb)))
        ((< ha hb) (cons ha (union-set ta b)))
        ((> ha hb) (cons hb (union-set a tb))))))))