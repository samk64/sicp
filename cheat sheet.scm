; cheat sheet

; rounding numbers
(exact->inexact (/ 4 7))
;Value: .5714285714285714

; get current path
(pwd)
;Value 14: #[pathname 14 "/home/samuelkim/workarea/sicp/"]

; load a file
(load "1/1.01.scm")

; nil value
'()

;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Chapter 1
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Conditionals
; (cond (<p1> <e1>)
;       (<p2> <e2>)
;       ...
;       (<pn> <en>))
;       (else <e>)

;; If
;; Note: If does not evaluate the <alternative> if the consequent is true
; (if <predicate> <consequent> <alternative>)


; A minor difference between if and cond is that the <e> 
; part of each cond clause may be a sequence of expressions. 
; If the corresponding <p> is found to be true, the expressions 
; <e> are evaluated in sequence and the value of the final 
; expression in the sequence is returned as the value of the cond. 
; In an if expression, however, the <consequent> and <alternative> 
; must be single expressions.