; Exercise 1.3.  
; Define a procedure that takes three numbers as arguments 
; and returns the sum of the squares of the two larger numbers.

; how to get the top 2 largest numbers from a list of 3

; method 1: sort, then grab top two
; method 2: get max of a list, then get max of another smaller list
; method 3: use if statements
; method 4: remove smallest element from list and do sum-of-squares on the other two

(define (sum-of-squares a b) 
    (+  (* a a) 
        (* b b))
)

(define (proc x y z)

    (let ( (min_xyz (min x y z)) )

        (cond ((= min_xyz x) (sum-of-squares y z))
              ((= min_xyz y) (sum-of-squares x z))
              (else (sum-of-squares x y)))
    )
)

(proc 1 2 3)
