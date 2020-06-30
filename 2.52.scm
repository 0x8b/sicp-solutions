(define wave
  (let ((a (make-point 0.2 0.8))
        (b (make-point 0.4 0.8))
        (c (make-point 0.2 0.6))
        (d (make-point 0.4 0.6))
        (e (make-point 0.6 0.8))
        (f (make-point 0.8 0.8))
        (g (make-point 0.6 0.6))
        (h (make-point 0.8 0.6))
        (i (make-point 0.2 0.4))
        (j (make-point 0.4 0.2))
        (k (make-point 0.6 0.2))
        (l (make-point 0.8 0.4)))
    (let ((segments (list (make-segment a d)
                          (make-segment b c)
                          (make-segment e h)
                          (make-segment g f)
                          (make-segment i j)
                          (make-segment j k)
                          (make-segment k l))))
      (segments->painter segments))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1)))
            (corner (corner-split painter (- n 1))))
        (beside (below painter up)
                (below right corner)))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four identity flip-horiz
                                  flip-vert rotate180)))
    (combine4 (corner-split painter n))))