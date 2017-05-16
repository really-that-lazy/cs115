;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m02extra) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; Question 1

;; Write a Racket function add-string that adds up all the number in a string of length 5.

;; (add-string str) produces the sum of all digits in str.
;; add-string Str -> Nat
;; Examples:
(check-expect (add-string "12345") 15)
(check-expect (add-string "24632") 17)

(define (add-string str)
  (+ (string->number (substring str 0 1))
     (string->number (substring str 1 2))
     (string->number (substring str 2 3))
     (string->number (substring str 3 4))
     (string->number (substring str 4 5))))

;; Tests: include tests here




;; Question 2

;; Write a Racket function reverse-string that reverses the letters in a string of length 5.

;; (reverse-string str) produces the reverse of str.
;; add-string Str -> Str
;; Examples:
(check-expect (reverse-string "12345") "54321")
(check-expect (reverse-string "24632") "23642")

(define (reverse-string str)
  (string-append
   (substring str 4 5)
   (substring str 3 4)
   (substring str 2 3)
   (substring str 1 2)
   (substring str 0 1)))

;; Tests: include tests here




;; Question 3

;; The cost of a ticket for a day of skiing depends on the age of the skier.

;; An adult ticket is $49, a youth ticket is $44, a senior ticket is $36 and a child ticket is $10.

;; A family rate cannot exceed $180.

;; Write a Racket function called ticket-cost that consumes the number of adults, youths, seniors, and children and produces the cost of ski tickets for the family.

;; Sample examples:
;; (ticket-cost 1 2 0 2) produces 157 (157 = 49 + 88 + 20).
;; (ticket-cost 2 2 1 1) produces the family rate of 180 (family rate applies since $232 is > $180).


;; Constants:
(define adult-rate 49)
(define youth-rate 44)
(define senior-rate 36)
(define child-rate 10)
(define max-rate 180)

;; (ticket-cost adults youths seniors children) produces the cost of ski tickets for adults, youths, seniors, and children
;; ticket-cost: Nat Nat Nat Nat -> Num
;; Examples:
(check-expect (ticket-cost 1 2 0 2) 157)
(check-expect (ticket-cost 2 2 1 1) 180)

(define (ticket-cost adults youths seniors children)
  (min max-rate
       (+ (* adults adult-rate)
          (* youths youth-rate)
          (* seniors senior-rate)
          (* children child-rate))))

;; Tests: include tests here




;; Question 4

;; Write a Racket function called monetize-name that consumes two strings, s1 and s2, and two natural numbers n1 and n2.

;; The function should produce a string that appends "$" to the natural number formed by assigning values to the characters in s1 and s2 as follows:

;; for s1: the first n1 characters are each worth $10, the rest of the characters are worth $20.
;; for s2: the first n2 characters are each worth $30, the rest of the characters are worth $40.
;; Hint: you may need to use the functions min and/or max.

;; For example:
;; (monetize-name "Debby" "John" 1 1) => "$240"
;; (monetize-name "" "John" 1 1) => "$150"
;; (monetize-name "Debby" "John" 10 10) => "$170"


;; Constants:
(define s1-part1 10)
(define s1-part2 20)
(define s2-part1 30)
(define s2-part2 40)

;; (monetize-name s1 s2 n1 n2) produces the $ value of s1 and s2 based on the values of n1 and n2.
;; monetize-name Str Str Nat Nat -> Str
;; Examples:
(check-expect (monetize-name "" "" 0 0) "$0")
(check-expect (monetize-name "Debby" "John" 1 1) "$240")

(define (first-part str n worth$)
  (* (min n (string-length str))
     worth$))

(define (second-part str n worth$)
  (* (max 0 (- (string-length str) n))
     worth$))

(define (monetize-name s1 s2 n1 n2)
  (string-append
   "$"
   (number->string
    (+ (first-part s1 n1 s1-part1)
       (second-part s1 n1 s1-part2)
       (first-part s2 n2 s2-part1)
       (second-part s2 n2 s2-part2)))))

;; Tests:
(check-expect (monetize-name "Debby" "John" 0 0) "$260")
(check-expect (monetize-name "" "John" 1 1) "$150")
(check-expect (monetize-name "" "" 1 1) "$0")

(check-expect (monetize-name "Debby" "John" 10 10) "$170")
(check-expect (monetize-name "Debby" "John" 0 10) "$220")


















