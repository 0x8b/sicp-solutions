(define (variable? x)
  (symbol? x))

(define (same-variable? x y)
  (and (variable? x)
       (variable? y)
       (eq? x y)))

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
  (let ((augends (cdr (cdr s))))
    (if (null? (cdr augends))
        (car augends)
        (cons '+ augends))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (let ((multiplicands (cdr (cdr p))))
    (if (null? (cdr multiplicands))
        (car multiplicands)
        (cons '* multiplicands))))

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
    (else
      (error "unknown expression type: DERIV" exp))))

(deriv '(* x y (+ x 3)) 'x)