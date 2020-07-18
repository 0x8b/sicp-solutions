(define (>= a b)
  (or (> a b) (= a b)))

(define (sum-larger-numbers a b c)
  (cond
    ((and (>= a c) (>= b c)) (+ a b))
    ((and (>= b a) (>= c a)) (+ b c))
    ((and (>= a b) (>= c b)) (+ a c))))