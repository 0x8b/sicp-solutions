(define (divides? a b)
    (= 0 (remainder a b)))

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

(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list j i)) (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum?
      (unique-pairs n))))