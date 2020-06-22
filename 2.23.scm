(define (for-each proc items)
  (cond
    ((pair? items) (proc (car items))
                   (for-each proc (cdr items)))))