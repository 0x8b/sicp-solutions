(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(fixed-point (lambda (x)
               (/ (log 1000.0) (log x))) 1.1) ; 4.555538934848503

(define (average a b)
  (/ (+ a b) 2))

(fixed-point (lambda (x)
               (average x (/ (log 1000.0) (log x)))) 1.1) ; 4.555536364911781
