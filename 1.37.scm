(define (<= a b)
  (or (< a b) (= a b)))

(define (cont-frac n d k)
  (define (iter i)
    (if (<= i k)
        (/ (n i)
           (+ (d i) (iter (+ i 1))))
        0))
  (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           38) ; 0.6180339887498948

(define (cont-frac.iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

(cont-frac.iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                100) ; 0.6180339887498948
