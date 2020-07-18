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

(define outline-segments
  (let ((bl (make-vect 0.0 0.0))
        (br (make-vect 1.0 0.0))
        (tl (make-vect 0.0 1.0))
        (tr (make-vect 1 1)))
    (let ((segments (list (make-segment bl br)
                          (make-segment br tr)
                          (make-segment tr tl)
                          (make-segment tl bl))))
      (segments->painter segments))))

(define x-segments
  (let ((bl (make-vect 0.0 0.0))
        (br (make-vect 1.0 0.0))
        (tl (make-vect 0.0 1.0))
        (tr (make-vect 1.0 1.0)))
    (let ((segments (list (make-segment bl tr)
                          (make-segment br tl))))
      (segments->painter segments))))

(define diamond-segments
  (let ((b (make-vect 0.5 0.0))
        (r (make-vect 1.0 0.5))
        (t (make-vect 0.5 1.0))
        (l (make-vect 0.0 0.5)))
    (let ((segments (list (make-segment b r)
                          (make-segment r t)
                          (make-segment t l)
                          (make-segment l b))))
      (segments->painter segments))))

(define wave-segments
  (let ((a (make-vect 0.00 0.50))
        (b (make-vect 0.25 0.75))
        (c (make-vect 0.75 0.25))
        (d (make-vect 1.00 0.50)))
    (let ((segments (list (make-segment a b)
                          (make-segment b c)
                          (make-segment c d))))
      (segments->painter segments))))