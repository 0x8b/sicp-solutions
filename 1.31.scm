(define (product.rec term a next b)
  (define (iter a)
    (if (> a b)
        1
        (* (term a) (iter (next a)))))

  (iter a))

(define (product.iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))

  (iter a 1))

(define (identity x) x)

(define (factorial n)
  (if (= n 0)
      1
      (product.rec identity 1 inc n)))

(factorial 0) ; 1
(factorial 1) ; 1
(factorial 2) ; 2
(factorial 6) ; 720

(define (square x)
  (* x x))

(define (pi-wallis n)
  (define (term n)
    (/ (square (* 2 n)) (* (- (* 2 n) 1) (+ (* 2 n) 1))))

  (if (= n 0)
      0
      (* 2 (product.iter term 1 inc n))))

(exact->inexact (pi-wallis 1000)) ; 3.1408077460303945
