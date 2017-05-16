;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mo1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; using built-in functions. Show these in the interactions window.
;(quotient 75 7)
;(remainder 75 7)
;(abs (- 2 100))
;(expt 2 32)
;(ceiling 23.4)
;(floor 19.999)
;(expt 25 1000)
;; Not every expression will have a value!
;;(sqrt 100 2)
;;(+ 4)
;;(-4) different from (- 4) 



;; First function definitions
;(define (f x) (* x x))
;(define (g x y) (- x y))

; (f 3)
; (g 2 6)
;(define (f z) (* z z))
;(define (g a b) (- a b))

;; Write a function prev-age that consumes age, an integer,
;; and produces the age in the previous year
(define (prev-age age)
  (- age 1))

;; Write a function next-age that consumes age, an integer,
;; and produces the age in the next year
(define (next-age age)
  (+ age 1))

;; Write a function two-years-from-now that consumes age, an integer,
;; and produces the age in the next two year
(define (two-years-from-now age)
  (+ 2 age))
;(prev-age 19)
;(next-age 100)


;; Constants 
;(define k 3)
;(define p (* k k))

;; Example - 
;(define brother-age 10)
;(define sister-age (- brother-age 4))
;(define (increase-sister-age more)
;  (+ sister-age more)) 
;(increase-sister-age 5)

;; Identifiers and binding
;; Warning:  just because Racket allows something doesn't
;; mean it is a good thing for you to do!!!!
;; Using meaningful names for functions and parameters
;; will avoid most of the confusion of these rules.

;; Names of parameters of two different functions:
;; Can two functions use the same parameter name? - Yes
;(define (f x) (* x x))
;(define (g x y) (- x y))

;; constant and a parameter of a function:
;; Can a constant and a function parameter use the same name? - Yes
;(define x 3)
;(define (f x) (* x x))
; (f 2) => 4
; (f x) => 9

;;Two constants: can two constants have the same name? - No
;(define x 4)
;(define x 5)

;; constant and name of fn
;; Can a constant and a function have the same name? - No
;(define x 4)
;(define (x y) (* 5 y))

;; name and parameter of different functions
;; Can the name of one function be the same as
;; the parameter name of another function? - Yes
;(define (x y) (* 5 y))
;(define (z x) (* 3 x))

;; name and parameter of same function
;; Can a function name also be the name of
;; its parameter? - Yes, but Poor Style, Don't do it!
;(define (x x) (+ 1 x))


;; Tracing Racket programs
;(define (f x) (* x x))
;(define (g x y) (- x y))
;(g (f 2) (g 3 1))

(define (term x y) (* x (sqr y)))
;(term (- 5 3) (+ 1 2))
;(term 2 (+ 1 2))
;(term 2 3)
;(* 2 (sqr 3))
;(* 2 9)
;18

;; Write a function total-cost that consumes the price
;; of an item and produces the total-cost
(define hst 0.13)
(define (total-cost price)
  (* price (+ 1 hst)))
;(total-cost 10.00)

;; A small program with an error - try tracing this as well
;; (sqrt 7 9) has no meaning -
;; when in the trace (by hand or using stepper) is this discovered?
;(+ 67 (* 4 5) (sqrt 7 9))
;(+ 67 20 (sqrt 7 9))
;Error

;; Another to trace
(define discount 0.10)

;; Produce the adjusted price when a discount is applied
;; to original-price
(define (sale-price original-price)
  (- original-price 
     (* discount original-price)))

(define (sale-price-v2 original-price)
  (* original-price (- 1 discount)))

;(sale-price 50)
;(sale-price-v2 50)

(define jeans-price 50)
(define top-price (* 2 15))
;(sale-price (+ jeans-price (* 2 top-price)))
#|
(define top-price 30)
(sale-price (+ 50 (* 2 top-price)))
(sale-price (+ 50 (* 2 30)))
(sale-price (+ 50 60))
(sale-price 110)
(- 110 (* discount 110))
(- 110 (* 0.10 110))
(- 110 11)
99
|#


;; Extra examples to consider

;; Write a function magic-number that consumes a two digit number, and 
;; produces the difference between that number and the sum of its digits. 

;; base is number-system base being used
(define base 10)

;; This function consumes a two-digit number and produces the
;; difference between that number and the sum of its digits. 

(define (special-number two-digit)
  (- two-digit
     (+ (remainder two-digit base)
        (quotient two-digit base))))

;; testing
;(special-number 78) ; answer should be 63, ie 78 - (7 + 8)
;(special-number 10)  ; answer should be 9, ie 10 - (1 + 0)

;; Write a Racket program to determine the cost of an item ordered online,
;; which costs price dollars, includes 10.95 shipping, and charges hst of 13%.
;; Note hst is applied to the price and the shipping charge. 

;; constants for shipping charges and hst rate
(define shipping-cost 10.95)
(define tax 0.13)

(define (total-price price)
  (+ price shipping-cost ; price + shipping
     (* (+ price shipping-cost) tax))) ; + tax on price and shipping

;(total-price 10.00)






