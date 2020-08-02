(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (monte-carlo trials (lambda () (p (random-in-range x1 x2)
                                    (random-in-range y1 y2)))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(* 6 6 (estimate-integral (lambda (x y) (<= (+ (square (- x 5.0)) (square (- y 7.0))) (square 3.0))) 2.0 8.0 4.0 10.0 10000)) ; 70803/2500

;; estimate pi
(* 4 (estimate-integral (lambda (x y) (<= (sqrt (+ (square x) (square y))) 1.0)) -1.0 1.0 -1.0 1.0 100000)) ; 39293/12500

