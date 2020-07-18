(define (variable? x) (symbol? x))

(define (same-variable? x y)
  (and (variable? x) (variable? y) (eq? x y)))

(define (make-sum a b)
  (cond
    ((=number? a 0) b)
    ((=number? b 0) a)
    ((and (number? a)
          (number? b))
     (+ a b))
    (else (list '+ a b))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product a b)
  (cond
    ((or (=number? a 0)
         (=number? b 0)) 0)
    ((=number? a 1) b)
    ((=number? b 1) a)
    ((and (number? a) (number? b)) (* a b))
    (else (list '* a b))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s)
  (cadr s))

(define (augend s)
  (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp)
     (if (same-variable? exp var) 1 0))
    ((sum? exp)
     (make-sum
       (deriv (addend exp) var)
       (deriv (augend exp) var)))
    ((product? exp)
     (make-sum
       (make-product (multiplier exp)
                     (deriv (multiplicand exp) var))
       (make-product (deriv (multiplier exp) var)
                     (multiplicand exp))))
    ((exponentation? exp)
     (make-product
       (exponent exp)
       (make-product
         (make-exponentation (base exp)
                             (make-sum (exponent exp) -1))
         (deriv (base exp) var))))
    (else
      (error "unknown expression type: DERIV" exp))))

(deriv '(+ x 3) 'x) ; 1
(deriv '(* x y) 'x) ; y
(deriv '(* (* x y) (+ x 3)) 'x) ; (+ (* x y) (* y (+ x 3)))

(define (exponentation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-exponentation a b)
  (cond
    ((=number? b 1) a)
    ((=number? b 0) 1)
    ((and (number? a)
          (number? b))
     (expt a b))
    (else (list '** a b))))

(deriv '(** x 7) 'x) ; (* 7 (** x 6))