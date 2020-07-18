(define (make-interval a b)
  (cons (min a b)
        (max a b)))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (car interval))

(define (mul-interval a b)
  (define (opposite-signs? a b)
    (cond
      ((and (positive? a) (positive? b)) false)
      ((and (negative? a) (negative? b)) false)
      (else true)))

  (define (positive-signs? a b)
    (and (not (opposite-signs? a b))
         (>= a 0)))

  (define (negative-signs? a b)
    (and (not (opposite-signs? a b))
         (< b 0)))
  
  (let ((la (lower-bound a))
        (ha (upper-bound a))
        (lb (lower-bound b))
        (hb (upper-bound b)))
    (cond ((positive-signs? la ha)
           (cond ((positive-signs? lb hb)
                  (make-interval (* la lb) (* ha hb)))
                 ((negative-signs? lb hb)
                  (make-interval (* ha lb) (* la hb)))
                 (else (make-interval (* ha lb) (* ha hb)))))
          ((negative-signs? la ha)
           (cond ((positive-signs? lb hb)
                  (make-interval (* la hb) (* ha lb)))
                 ((negative-signs? lb hb)
                  (make-interval (* ha hb) (* la lb)))
                 (else (make-interval (* la hb) (* la lb)))))
          (else
           (cond ((positive-signs? lb hb)
                  (make-interval (* la hb) (* ha hb)))
                 ((negative-signs? lb hb)
                  (make-interval (* ha lb) (* la lb)))
                 (else
                  (make-interval ((lambda (a b) (if (< a b) a b)) (* la hb) (* ha lb))
                                 ((lambda (a b) (if (> a b) a b)) (* la lb) (* ha hb)))))))))