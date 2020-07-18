(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(fixed-point cos 1.0) ; 0.7390822985224024
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0) ; 1.2587315962971173

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 4) ; 2.000000000000002

; ex. 1.35
(fixed-point (lambda (y) (+ 1.0 (/ 1.0 y))) 1.0) ; 1.6180327868852458
