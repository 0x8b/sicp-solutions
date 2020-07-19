(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))

(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts) right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))

(define (union-set a b)
  (define (merge-unique a b)
    (cond
      ((null? a) b)
      ((null? b) a)
      (else (let ((ha (car a))
                  (ta (cdr a))
                  (hb (car b))
                  (tb (cdr b)))
        (cond
          ((= ha hb) (cons ha (merge-unique ta tb)))
          ((< ha hb) (cons ha (merge-unique ta b)))
          ((> ha hb) (cons hb (merge-unique a tb))))))))

  (let ((a-list (tree->list a))
        (b-list (tree->list b)))
    (let ((merged (merge-unique a-list b-list)))
      (list->tree merged))))

(union-set '(2 (1 () ()) (3 () ())) '(4 (1 () ()) (5 () ()))) ; (3 (1 () (2 () ())) (4 () (5 () ())))

(define (intersection-set a b)
  (define (intersection-list a b)
    (if (or (null? a) (null? b))
        '()
        (let ((a1 (car a)) (b1 (car b)))
          (cond
            ((= a1 b1)
             (cons a1 (intersection-list (cdr a) (cdr b))))
            ((< a1 b1)
             (intersection-list (cdr a) b))
            ((> a1 b1)
             (intersection-list a (cdr b)))))))

  (let ((a-as-list (tree->list a))
        (b-as-list (tree->list b)))
    (list->tree (intersection-list a-as-list b-as-list))))

(intersection-set '(2 (1 () ()) (4 () ())) '(2 (1 () ()) (3 () ()))) ; (1 () (2 () ()))