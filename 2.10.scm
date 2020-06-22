(define (make-interval lb ub)
  (cons lb ub))

(define (lower-bound interval)
  (min (car interval)
       (cdr interval)))

(define (upper-bound interval)
  (max (car interval)
       (cdr interval)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (or (= 0 (lower-bound y)) (= 0 (upper-bound y)))
      (error "One of bounds is 0.")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))