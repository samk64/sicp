; Exercise 1.8.  Newton's method for cube roots is based on the fact that 
; if y is an approximation to the cube root of x, then a better approximation 
; is given by the value

(/ 	(+ 	(/ 	x 
			(* 	y y)) 
		(* 2 y)
	3
	)