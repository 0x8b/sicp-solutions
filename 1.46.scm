(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt x)
  (define (average a b)
    (/ (+ a b) 2))

  (define (square x)
    (* x x))

  (define (good-enough? guess)
    (let ((tolerance 0.00001))
      (< (abs (- (square guess) x)) tolerance)))

  (define (improve guess)
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) 1.0))

(sqrt 9) ; 3.000000001396984

(define (fixed-point f guess)
  (define (close-enough? a b)
    (let ((tolerance 0.00001))
      (< (abs (- a b)) tolerance)))

  (let ((good-enough? (lambda (x) (close-enough? x (f x))))
        (improve f))
    ((iterative-improve good-enough? improve) guess)))

(fixed-point cos 1.0) ; 0.7390893414033927
