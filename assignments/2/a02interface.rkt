;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Copy the function header for each question into the a02qY.rkt file, for Y=1,2,3,4.
;; and replace ... with the body of the function


;; Question 1
(define (grocery-cost fruits pastries cereal high low)
  ...)

;; Question 2
(define (gen-username fname lname)
  (...))

;; Question 3
(define (income-tax income)
  (...))

;; Question 4

;; Helper function - include it in your a02q4.rkt file if you use it in your solution
;; (sum-2-digits nn) produces the sum of the digits of the two digit value nn
;; sum-2-digits: Nat -> Nat
;; requires: nn <= 99
;; Examples:
(check-expect (sum-2-digits 62) 8)
(check-expect (sum-2-digits 60) 6)

(define (sum-2-digits nn)
  (+ (remainder nn 10)
     (quotient nn 10)))

;; Tests:
(check-expect (sum-2-digits 0) 0)
(check-expect (sum-2-digits 3) 3)
(check-expect (sum-2-digits 34) 7)
(check-expect (sum-2-digits 99) 18)

(define (luhns-digit candidate)
  ...)




