(define nil '())

(define (same-parity first . rest)
  (define (filter seq)
    (cond
      ((null? seq) nil)
      ((even? (+ (car seq) first)) (cons (car seq) (filter (cdr seq))))
      (else (filter (cdr seq)))))

  (cons first (filter rest)))

; test
(display (same-parity 1 2 3 4 5 6 7)) ; 1 3 5 7
(newline)
(display (same-parity 2 3 4 5 6 7)) ; 2 4 6