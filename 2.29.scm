(import (scheme base))

; (define (make-mobile left right)
;   (list left right))

; (define (make-branch length structure)
;   (list length structure))

; (define (left-branch structure)
;   (car structure))

; (define (right-branch structure)
;   (car (cdr structure)))

; (define (branch-length branch)
;   (car branch))

; (define (branch-structure branch)
;   (car (cdr branch)))

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch structure)
  (car structure))

(define (right-branch structure)
  (cdr structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (total-weight tree)
  (cond
    ((number? tree) tree)
    (else (let ((left (left-branch tree))
                (right (right-branch tree)))
            (+ (total-weight (branch-structure left))
               (total-weight (branch-structure right)))))))

(define (balanced? tree)
  (cond
    ((number? tree) #t)
    (else (let ((left (left-branch tree))
                (right (right-branch tree)))
            (let ((left-tree (branch-structure left))
                  (right-tree (branch-structure right)))
              (and (= (* (branch-length left) (total-weight left-tree))
                      (* (branch-length right) (total-weight right-tree)))
                   (balanced? left-tree)
                   (balanced? right-tree)))))))