(define (<= a b)
  (or (< a b) (= a b)))

(define (cont-frac n d k)
  (define (iter i)
    (if (<= i k)
        (/ (n i)
           (+ (d i) (iter (+ i 1))))
        0))

  (iter 1))

(define (tan-cf x k)
  (- (cont-frac (lambda (i) (- (expt x (if (= i 1) 1 2))))
                (lambda (i) (+ i i -1))
                k)))

(define pi 3.14159)

(define (deg->rad deg)
  (* pi (/ deg 180.0)))

(tan-cf (deg->rad 45) 30) ; 0.9999986732059835
