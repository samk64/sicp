; Exercise 1.5.  Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using 
; applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
;   - He will observe 0, 
; What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. 
;   - The p must fully expand before being applied

;   (Assume that the evaluation rule for the special form if is the same whether the interpreter is using 
;   normal or applicative order: The predicate expression is evaluated first, 
;   and the result determines whether to evaluate the consequent or the alternative expression.)

; order 1: applicative order evaluation: evaluate arguments first, they apply
; thus applying the arguments 0 and (p) before running would cause the 
; interpreter to recurse infinitely, because (p) calls itself forever.
; (define (test 0 (p))
; (define (test 0 (p))
; (define (test 0 (p))
; --> recursion error
;
; order 2: normal order evaluation: (lazy evaluation) 
; do not apply evaluate value until needed
; fully expand all operands, then reduce
; (define (test 0 (p))
; (define (test 0 (p)) ;
; (if (= 0 0) 0 (p))
; (if #t 0 (p))
; 0

; more helpful example:
(define (test x y)
  (if (= x 0)
      0
      y))

; (test 0 (/ 1 0))
; normal order (lazy evaluation) evaluates to 0
; applicative order gives an error