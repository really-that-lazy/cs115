;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname labinterface03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Lab 03, Question 1



;; Lab 03, Question 4

(define (shipping-bill handling charge-per-kg weight boxes)
  (+ handling (* boxes (* charge-per-kg weight))))
(shipping-bill 1 1 1 1)
