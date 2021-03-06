(define (gcd a b)
  (if (= 0 (remainder a b))
      b
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n-abs (abs (/ n g)))
          (d-abs (abs (/ d g))))
      (if (< (* n d) 0)
          (cons (- n-abs) d-abs)
          (cons n-abs d-abs)))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))
