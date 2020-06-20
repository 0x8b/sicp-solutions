(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car c)
  (let ((b (cdr c)))
    (let ((a (/ (log (/ c (expt 3 b)))
                (log 2))))
      (inexact->exact (round a)))))

(define (cdr c)
  (define (count counter number)
    (if (= 0 (remainder number 3))
        (count (+ counter 1) (/ number 3))
        counter))

  (count 0 c))

; test
(define c (cons 6 5))
(car c) ; 6
(cdr c) ; 5
