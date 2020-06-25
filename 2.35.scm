(import (scheme base))

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree t)
  (cond
    ((null? t) nil)
    ((not (pair? t)) (list t))
    (else (append (enumerate-tree (car t))
            (enumerate-tree (cdr t))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))