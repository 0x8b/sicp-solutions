(define (split join join-smaller)
  (define (splitter painter n)
    (if (= n 0)
        painter
        (let ((smaller (splitter painter (- n 1))))
          (join painter (join-smaller smaller smaller)))))

  splitter)

(define right-split (split beside below))

(define up-split (split below beside))