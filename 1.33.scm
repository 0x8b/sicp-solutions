(define (filtered-accumulate predicate? combiner null-value term a next b)
  (define (iter a)
    (cond
      ((> a b) null-value)
      ((predicate? a) (combiner (term a) (iter (next a))))
      (else (iter (next a)))))

  (iter a))

(define (<= a b)
  (or (< a b) (= a b)))

(define (divides? a b)
    (= 0 (remainder a b)))

(define (square x)
  (* x x))

(define (prime? n)
  (define (prime-iter d)
    (if (<= (square d) n)
        (cond
          ((divides? n d) false)
          ((divides? n (+ d 2)) false)
          (else (prime-iter (+ d 6))))
        true))

  (cond
    ((<= n 3) (> n 1))
    ((divides? n 2) false)
    ((divides? n 3) false)
    (else (prime-iter 5))))

(define (identity x) x)

(define (sum-primes a b)
  (filtered-accumulate prime? + 0 identity a inc b))

(define (gcd a b)
  (if (divides? a b)
      b
      (gcd b (remainder a b))))

(define (coprime-to n)
  (define (coprime? a)
    (= 1 (gcd a n)))

  coprime?)

(define (multiply-coprimes n)
  (filtered-accumulate (coprime-to n) * 1 identity 0 inc (- n 1)))

(sum-primes 0 10) ; 17
(multiply-coprimes 10) ; 189
