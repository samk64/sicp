;;; scale a list
(define (scale-list s l)
  (if (null? l)
      ;; if true
      '()
      ;; if false
      (cons   
         (* s (car l)) 
         (scale-list s (cdr l))
       )
   )
)

(scale-list 3 (list 1 2 3))
