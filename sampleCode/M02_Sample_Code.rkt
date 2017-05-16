;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname M02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Module 02


;; Purpose:
;; (sum-of-squares p1 p2) produces the sum of the squares of
;; p1 and p2
;; Contract: sum-of-squares: Num Num => Num
;; Examples: to show what the function does
(check-expect (sum-of-squares 3 4) 25)
(check-expect (sum-of-squares 0 -2.5) 6.25)


(define (sum-of-squares p1 p2)
  (+ (* p1 p1) (* p2 p2)))

;; Tests for sum-of-squares:
;; to verify that the function does what it should do correctly
(check-expect (sum-of-squares -1 -2) 5) ; negative p1 and p2
(check-expect (sum-of-squares 0 0) 0) ; p1 and p2 are 0
(check-expect (sum-of-squares -10 2.5) 106.25) ; negative p1, positive p2. int p1, real p2.
(check-expect (sum-of-squares 1 -1) 2) ; +ve p1 and -ve p2



;; Another simple design recipe example
;; Write a function double that consumes a 
;; number called value and produces 2 times 
;; that value

;; purpose: (double value) produces 2 * value
;; double: Num -> Num
;; examples: (double 4) => 8, (double -1) => -2
(check-expect (double 4) 8)
(check-expect (double -1) -2)

(define (double value)
  (* 2 value))

;; testing
;; (double 4) => 8
(check-expect (double 4) 8)
;; (double -1) => -2(remainder
(check-expect (double -1) -2)
;; (double 0) => 0
(check-expect (double 0) 0)
;; (double 4/5) => 8/5
(check-expect (double 4/5) 8/5)

#|
;; Requirements
(remainder 0 10)
(remainder -152 10)
(remainder 2 10)

;; These are incorrect expressions.
;; remainder requires a Nat or an Int, not a Num.
;; (remainder -152.65 10)
;; (remainder 2.3 10)
|#

;; Sometimes, restrictions are needed to avoid errors:
;; (sqrt-shift x c) produces the squareroot of (x - c).
;; sqrt-shift: Num Num -> Num
;; requires: x >= c
(define (sqrt-shift x c)
  (sqrt (- x c)))

(sqrt-shift 10 2)
;; produces a complex number and we don't want complex numbers
;; so, we'll use requires as a way to avoid such error

#|
;; Sometimes, restrictions are caused by the nature of the data:
;; (bump-grade g inc) produces g+inc, up to a maximum of 100
;; bump-grade: Num Num -> Num
;; requires: 0 <= g <= 100
;;           0 <= inc <= 10
(define (bump-grade g inc) 
  (min (+ g inc) 100))
|#


#|
;; Tests: check-expect
(check-expect (sqr 2) 4) ; this test should pass
(check-expect (sqr 2) 3) ; this test should fail
|#


;; Failed Tests:
;;(check-expect pi pi)
;;(check-expect (sqr 2) (sqr 2))
;(check-within 10 5 4) ; Fails

;(check-within 10 5 5) ; Passes


;; Tests: check-within
;; Note: check-expect only works with exact numbers. 
;; The following code will result in an error.
(define (circle-area r) 
  (* pi r r)) 
;;(check-expect (circle-area 1) pi)
;; When using expected or actual values which are
;; inexact or approximations, use check-within.
(check-within (circle-area 1) pi 0.00001)
(check-within pi pi 0.1)




#|
;; String functions:
(string-append "now" "here") ; => "nowhere"
(string-length "length") ; -> 6
(substring "caterpillar" 5 9) ; => "pill"
(substring "cat" 0 0) ; -> ""
(substring "nowhere" 3) ; => "here"

(define a "later")
(define b "boom")
(define c (string-append a " " b))
(define d (substring c 1 4))
(define f (substring c 1 (- (string-length b) 1)))
(define g (string-append
           (substring a (- (string-length a) 1))
           (substring b 1)))
(string-append "a:- " a)
(string-append "b:- " b)
(string-append "c:- " c)
(string-append "d:- " d)
(string-append "f:- " f)
(string-append "g:- " g)
|#

#|
;; Finding the midpoint
;; (mid t) produces the integer part of (string-length t)/2. 
;; mid: Str -> Nat
;; Examples:
(check-expect (mid "cs115") 2)
(check-expect (mid "Hi") 1)
(define (mid t) 
  (quotient (string-length t) 2))
;; Tests for mid 
(check-expect (mid "") 0) (check-expect (mid "A") 0)


;; Extracting the front
;; (front-part s) produces the front part of s.
;; front-part: Str -> Str
;; Examples:
(check-expect (front-part "angle") "an") 
(check-expect (front-part "potshots") "pots")
(define (front-part s) 
  (substring s 0 (mid s)))
;; Tests for front-part
(check-expect (front-part "") "") 
(check-expect (front-part "Z") "")


;; Extracting the back
;; (back-part s) produces the back part of s.
;; back-part: Str -> Str
;; Examples:
(check-expect (back-part "angle") "gle") 
(check-expect (back-part "potshots") "hots")
(define (back-part s) 
  (substring s (mid s)))
;; Tests for back-part
(check-expect (back-part "") "") 
(check-expect (back-part "B") "B")


;; Main Function swap-part
;; (swap-part s) produces a new string like s, with front and back 
;; parts reversed.
;; swap-parts: Str -> Str
;; Examples:
(check-expect (swap-parts "angle") "glean") 
(check-expect (swap-parts "potshots") "hotspots")
(define (swap-parts s)
  (string-append (back-part s) (front-part s)))
;; Tests for swap-parts
(check-expect (swap-parts "") "") 
(check-expect (swap-parts "Z") "Z")
|#




#|
;; Phone Bill
;; cell-bill function

;; constants for phone plan 

;; Free limits
(define day-free 100) 
(define eve-free 200)

;; Rates per minute 
(define day-rate 1) 
(define eve-rate .5)


;; (charges-for minutes freelimit rate) produces charges for minutes, 
;; given the rate per minute past the freelimit.
;; charges-for: Nat Nat Num -> Num
;; requires: rate >= 0
;; Examples:
(check-expect (charges-for 101 100 5) 5) 
(check-expect (charges-for 99 100 34) 0)
(define (charges-for minutes freelimit rate) 
  (max 0 (* (- minutes freelimit) rate)))
;; Tests for charges-for:
(check-expect (charges-for 100 100 5) 0)



;; (cell-bill day eve) produces cell phone bill for day daytime 
;; minutes and eve evening minutes used.
;; cell-bill: Nat Nat -> Num
;; Examples:
(check-expect (cell-bill 101 0) 1) 
(check-expect (cell-bill 99 0) 0) 
(check-expect (cell-bill 0 199) 0) 
(check-expect (cell-bill 0 202) 1) 
(check-expect (cell-bill 150 300) 100)


;; Completing cell-bill
(define (cell-bill day eve) 
  (+
   (charges-for day day-free day-rate) 
   (charges-for eve eve-free eve-rate)))
;; Tests for cell-bill
(check-expect (cell-bill 100 0) 0) 
(check-expect (cell-bill 0 200) 0) 
(check-expect (cell-bill 50 175) 0) 
(check-expect (cell-bill 100 200) 0)
|#


