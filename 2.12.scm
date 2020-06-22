(define (make-interval lb ub)
  (cons lb ub))

(define (lower-bound interval)
  (min (car interval)
       (cdr interval)))

(define (upper-bound interval)
  (max (car interval)
       (cdr interval)))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-interval (- c w) (+ c w))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (* (/ (/ (- (upper-bound i)
              (lower-bound i))
           2)
        (center i))
     100))