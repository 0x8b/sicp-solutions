(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-down
            (transform-painter painter1
                               split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0)))
          (paint-up
            (transform-painter painter2
                               (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point)))
      (lambda (frame)
        (paint-up frame)
        (paint-down frame)))))

; (define (below painter1 painter2)
;   (rotate-270 (beside (rotate-90 painter1)
;                       (rotate-90 painter2))))