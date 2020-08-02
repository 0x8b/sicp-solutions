(define random-init 0)

(define (rand-update x)
  (+ x 1))

(define rand
  (let ((x random-init))
    (lambda (message)
      (cond ((eq? message 'generate)
             (set! x (rand-update x))
             x)
            ((eq? message 'reset)
             (lambda (new-value)
               (set! x new-value)))))))

;; test
(rand 'generate) ; 1
(rand 'generate) ; 2
(rand 'generate) ; 3
((rand 'reset) random-init) ; 3
(rand 'generate) ; 1
(rand 'generate) ; 2