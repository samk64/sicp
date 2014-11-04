; Exercise 1.7.  The good-enough? test used in computing square roots will not
; be very effective for finding the square roots of very small numbers. Also, 
; in real computers, arithmetic operations are almost always performed with limited 
; precision. This makes our test inadequate for very large numbers. Explain these 
; statements, with examples showing how the test fails for small and large numbers. 
;
; An alternative strategy for implementing good-enough? is to watch how guess changes 
; from one iteration to the next and to stop when the change is a very small fraction
; of the guess. Design a square-root procedure that uses this kind of end test. 
; Does this work better for small and large numbers?

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
      (exact->inexact guess)
      (sqrt-iter (improve guess x)
                 x)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; for small numbers, the numerical difference will be smaller than the constant 
; used by good-enough?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(sqrt-iter 1 0.000001)
;Value: 3.1260655525445276e-2
; incorrect for small values - should be closer to .001

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; for large numbers, the difference between iterations may not be small enough
; for the program to complete, and it will never return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(sqrt-iter 1 99999)
;Value: 316.22618487760616
; this value works, but for very large numbers, the function will not return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sqrt-iter changed to stop when the change is a very small fraction of the guess
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (percent-change prev cur) 
    (* 100 
        (/  (-  prev cur) 
                cur)))

(define (good-enough-new? prev cur x)
     (cond  ( (and  (null? prev) (= (square cur) x)) #t)
            ( (and (null? prev)) #f)
            (else (<    (abs (percent-change prev cur)) 
                        1))))

(define (sqrt-iter-helper prev-guess guess x)
  (if (good-enough-new? prev-guess guess x)
      (exact->inexact guess)
      (sqrt-iter-helper guess (improve guess x) x)))

(define (sqrt-iter-new guess x)
    (sqrt-iter-helper '() guess x))

(sqrt-iter-new 2 4)

; test if good-enough-new works
; return #t
(good-enough-new?   (improve (improve (improve 1 4) 4) 4) 
                    (improve (improve (improve (improve 1 4) 4) 4) 4)
                    4)

; test if sqrt-iter-helper works
; return the final guess
(sqrt-iter-helper   (improve (improve (improve 1 4) 4) 4)
                    (improve (improve (improve (improve 1 4) 4) 4) 4)
                    4)

; test sqrt-iter-new
; returns the same as above
(sqrt-iter-new 1 4)

; yes, this works better for small and large numbers
; for large numbers, it also is able to complete
(sqrt-iter-new 1 0.000001)
(sqrt-iter-new 1 999999)

