(define wave
  (let ((a (make-vect 0.2 0.8))
        (b (make-vect 0.4 0.8))
        (c (make-vect 0.2 0.6))
        (d (make-vect 0.4 0.6))
        (e (make-vect 0.6 0.8))
        (f (make-vect 0.8 0.8))
        (g (make-vect 0.6 0.6))
        (h (make-vect 0.8 0.6))
        (i (make-vect 0.2 0.4))
        (j (make-vect 0.4 0.2))
        (k (make-vect 0.6 0.2))
        (l (make-vect 0.8 0.4)))
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
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))