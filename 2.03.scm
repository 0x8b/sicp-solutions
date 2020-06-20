(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (make-rectangle top-left-corner width height)
  (cons top-left-corner (cons width height)))

(define (width rect)
  (car (cdr rect)))

(define (height rect)
  (cdr (cdr rect)))

;(define (make-rectangle top-left-corner bottom-right-corner)
;  (cons top-left-corner bottom-right-corner))

;(define (width rect)
;  (let ((top-left-corner (car rect))
;        (bottom-right-corner (cdr rect)))
;    (- (x-point bottom-right-corner)
;       (x-point top-left-corner))))

;(define (height rect)
;  (let ((top-left-corner (car rect))
;        (bottom-right-corner (cdr rect)))
;    (- (y-point bottom-right-corner)
;       (y-point top-left-corner))))

(define (area rect)
  (* (width rect)
     (height rect)))

(define (perimeter rect)
  (* 2 (+ (width rect)
          (height rect))))

; test
(define rect (make-rectangle (make-point 1 1) 3 4))
(area rect)
(perimeter rect)
