(define (key record) record)
(define entry car)
(define left-branch cadr)
(define right-branch caddr)

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      false
      (let ((k (key (entry set-of-records))))
        (cond
          ((= given-key k) (entry set-of-records))
          ((< given-key k) (lookup given-key (left-branch set-of-records)))
          ((> given-key k) (lookup given-key (right-branch set-of-records)))))))

(define tree '(3 (2 () ()) (5 (4 () ()) (6 () ()))))
(lookup 1 tree) ; #f
(lookup 3 tree) ; 3
(lookup 2 tree) ; 2
(lookup 6 tree) ; 6