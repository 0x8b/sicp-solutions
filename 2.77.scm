;; (magnitude z)
;; (magnitude (make-complex-from-real-imag 3 4))
;; (magnitude ((get 'make-from-real-imag 'complex) 3 4))
;; (magnitude (tag (make-from-real-imag 3 4)))
;; (magnitude (tag ((get 'make-from-real-imag 'rectangular) 3 4)))
;; (magnitude (tag (tag (make-from-real-imag 3 4))))
;; (magnitude (tag (tag '(3 4))))
;; (magnitude (tag (attach-tag 'rectangular '(3 4))))
;; (magnitude (tag '(rectangular 3 4)))
;; (magnitude (attach-tag 'complex '(rectangular 3 4)))
;; (magnitude '(complex rectangular 3 4))
;; (apply-generic 'magnitude '(complex rectangular 3 4))
;; (magnitude '(rectangular 3 4))
;; (apply-generic 'magnitude '(rectangular 3 4))
;; (magnitude '(3 4))
;; 5

;; `apply-generic` is invoked 2 times