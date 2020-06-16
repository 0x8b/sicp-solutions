(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n)
  (+ n 1))

(define (cube a)
  (* a a a))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10) ; 3025

(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 10) ; 55

(define (pi-sum a b)
  (define (pi-next x)
    (+ x 4))

  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))

  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000)) ; 3.139592655589783

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))

  (* dx
     (sum f (+ a (/ dx 2)) add-dx b)))

(integral cube 0 1 0.01)  ; 0.24998750000000042
(integral cube 0 1 0.001) ; 0.249999875000001

(define (simpson f a b n)
  (define h (/ (- b a) n))

  (define (next x)
    (+ x h h))

  (* (/ h 3)
     (+ (- (f a))
        (- (f b))
        (* 2 (sum f a next b))
        (* 4 (sum f (+ a h) next b)))))

(simpson cube 0 1 100)  ; 1/4
(simpson cube 0 1 1000) ; 1/4
