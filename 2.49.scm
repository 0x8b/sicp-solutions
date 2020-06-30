(define (make-vect x y)
  (list x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cadr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (xcor-vect v))))

(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v)
                            (edge1-frame frame))
                (scale-vect (ycor-vect v)
                            (edge2-frame frame))))))

(define (segment->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
      segment-list)))

(define outline
  (let ((bl (make-point 0 0)
        (br (make-point 1 0))
        (tl (make-point 0 1))
        (tr (make-point 1 1))))
    (let ((segments (list (make-segment bl br)
                          (make-segment br tr)
                          (make-segment tr tl)
                          (make-segment tl bl))))
      (segments->painter segments))))

(define x
  (let ((bl (make-point 0 0)
        (br (make-point 1 0))
        (tl (make-point 0 1))
        (tr (make-point 1 1))))
    (let ((segments (list (make-segment bl tr)
                          (make-segment br tl))))
      (segments->painter segments))))

(define diamond
  (let ((b (make-point 0.5 0))
        (r (make-point 1 0.5))
        (t (make-point 0.5 1))
        (l (make-point 0 0.5)))
    (let ((segments (list (make-segment b r)
                          (make-segment r t)
                          (make-segment t l)
                          (make-segment l b))))
      (segments->painter segments))))

(define wave
  (let ((a (make-point 0 0.5))
        (b (make-point 0.25 0.75))
        (c (make-point 0.75 0.25))
        (d (make-point 1 0.5)))
    (let ((segments (list (make-segment a b)
                          (make-segment b c)
                          (make-segment c d))))
      (segments->painter segments))))