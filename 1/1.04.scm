; Exercise 1.4.  
; Observe that our model of evaluation allows for combinations whose 
; operators are compound expressions. Use this observation to describe 
; the behavior of the following procedure:

; the clause evaluates to the plus or minus operator 
; based on whether b is positive or negative. thus
; this result can be used in the succeeding expression
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
