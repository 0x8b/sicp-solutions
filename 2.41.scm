(define nil '())

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items)
          (accumulate op initial (cdr items)))))

(define (flatmap proc items)
  (accumulate append nil (map proc items)))

(define (ordered-triples n)
  (flatmap (lambda (third)
    (flatmap (lambda (second)
      (map (lambda (first) (list first second third))
           (enumerate-interval 1 second)))
      (enumerate-interval 1 third)))
    (enumerate-interval 1 n)))

(define (find-triples n s)
  (filter (lambda (triple) (= s (+ (car triple)
                                   (cadr triple)
                                   (caddr triple))))
          (ordered-triples n)))

(find-triples 5 10) ; ((3 3 4) (2 4 4) (2 3 5) (1 4 5))