;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; Question 3

(define-struct midterm (mark portion))
;; A Midterm is a (make-midterm Num Num)
;; requires: 0.0 <= mark <= 100
;;           0.0 <= portion <= 1.0

(define-struct result (student course mark))
;; A Result is a (make-result Str Sym Num)
;; requires: 0.0 <= mark <= 100

(define (get-result student course midterm final)

	(make-result student course (+ (* (midterm-mark midterm) (midterm-portion midterm) )  (* final (- 1 (midterm-portion midterm)))) )
	
)


(define m1 (make-midterm 75 0.50))
(define m2 (make-midterm 90 0.35))


(get-result "Joe Andy" 'CS115 m1 80.5)
(get-result "Jane Boole" 'CS115 m2 65.2)
