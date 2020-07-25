(define (make-tree entry left right)
  (list entry left right))

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

; a)
(define tree-1 '())
(define tree-2 (make-tree 0 '() '()))
(define tree-3 (make-tree 1 (make-tree 0 '() '()) '()))
(define tree-4 (make-tree 1 '() (make-tree 2 '() '()) ))
(define tree-5 (make-tree 1 (make-tree 0 '() '()) (make-tree 2 '() '())))

(map (lambda (tree) (equal? (tree->list-1 tree)
                            (tree->list-2 tree)))
     (list tree-1 tree-2 tree-3 tree-4 tree-5)) ;  (#t #t #t #t #t)

; b)
; tree->list-1: O(nlogn), because append takes O(n)
; tree->list-2: O(n)