; Exercise 1.8.  Newton's method for cube roots is based on the fact that 
; if y is an approximation to the cube root of x, then a better approximation 
; is given by the value

; Use this formula to implement a cube-root procedure analogous to the square-root 
; procedure. (In section 1.3.4 we will see how to implement Newton's method in general 
; as an abstraction of these square-root and cube-root procedures.)

; param x the input
; param y an approximation of x
(define (improve y x) 
    (/  (+  (/  x 
                (*  y y)) 
            (* 2 y))
        3))

(define (cube x) (* x x x))

(define (percent-change prev cur) 
    (* 100 
        (/  (-  prev cur) 
                cur)))

(define (good-enough? prev cur x)
     (cond  ( (and  (null? prev) (= (cube cur) x)) #t)
            ( (and (null? prev)) #f)
            (else (<    (abs (percent-change prev cur)) 
                        1))))

(define (cuberoot-iter-helper prev-guess guess x)
  (if (good-enough? prev-guess guess x)
      (exact->inexact guess)
      (cuberoot-iter-helper guess (improve guess x) x)))

(define (cuberoot-iter guess x)
    (cuberoot-iter-helper '() guess x))

(cuberoot-iter 1 8)
;Value: 2.000004911675504

