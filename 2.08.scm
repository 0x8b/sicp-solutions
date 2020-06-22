(define (make-interval lb ub)
  (cons lb ub))

(define (lower-bound interval)
  (min (car interval)
       (cdr interval)))

(define (upper-bound interval)
  (max (car interval)
       (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (lower-bound y))
                               (- (upper-bound y)))))