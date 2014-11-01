
; Exercise 1.6.  Alyssa P. Hacker doesn't see why if needs to be provided as a special form. 
; ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. 
; Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

; @param predicate      the conditional, #t or #f
; @param then-clause    the clause to be returned if predicate is #t 
; @param else-clause    the clause to be returned if predicate is #f
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

; (new-if (= 2 3) 0 5)
; 5

; (new-if (= 1 1) 0 5)
; 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

; the original sqrt-iter method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

; Alyssa's new sqrt-iter method
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

; Since "if" is a special form, it only allows for single expressions in the consequent
; and alternative of (if <predicate> <consequent> <alternative>), while "cond" allows
; for multiple expressions, returning the value of the final expression in the sequence

; Also, since the interpreter is applicative-order, it attempts to evaluate both arguments
; when using "new-if". When it tries to evaluate both, it gives no way for the method to return,
; so the method runs forever.

; As a more simple example, consider:
(define (p) (p))

; 1. Short circuit evaluation, returns true
;(if #t #t (p))

; 2. Due to applicative ordering, attempts to evaluate (p) and runs forever.
; (new-if #t #t (p))