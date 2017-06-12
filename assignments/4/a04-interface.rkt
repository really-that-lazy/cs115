;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; Question 1


(define-struct manager (name company branch))
;; A Manager is a (make-manager Str Str Sym)

(define-struct supervisor (name company branch))
;; A Supervisor is a (make-supervisor Str Str Sym)

;; A Staff is one of:
;; * a Manager
;; * a Supervisor

(define (same-branch? st1 st2)
  ...)



;; Question 2

(define-struct triangle (p1 p2 p3))
;; A Triangle is a (make-triangle Posn Posn Posn)

(define (valid-triangle? tr)
  ...)



;; Question 3

(define-struct midterm (mark portion))
;; A Midterm is a (make-midterm Num Num)
;; requires: 0.0 <= mark <= 100
;;           0.0 <= portion <= 1.0

(define-struct result (student course mark))
;; A Result is a (make-result Str Sym Num)
;; requires: 0.0 <= mark <= 100

(define (get-result student course midterm final)
  ...)


