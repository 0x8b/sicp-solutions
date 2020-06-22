(define (pascal c r)
  (if (or (= r c) (= 0 c))
      1
      (+ (pascal c (- r 1))
         (pascal (- c 1) (- r 1)))))

