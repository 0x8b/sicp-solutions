(define (make-interval a b)
  (cons (min a b)
        (max a b)))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-interval (- c w) (+ c w))))

(define (center interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

(define (percent interval)
  (* (/ (/ (- (upper-bound interval)
              (lower-bound interval))
           2)
        (center interval))
     100))