(define dx 1)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i composition)
    (if (< i n)
        (iter (+ i 1) (compose f composition))
        composition))

  (iter 0 (lambda (x) x)))

(define (smooth-function-n-times f n)
  (lambda (x) (((repeated smooth n) f) x)))

(define (square x)
  (* x x))

(define (smoothed-square x)
  ((smooth-function-n-times square 2) x))

(smoothed-square 7) ; 50 + 1/3
