;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname labinterface03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Lab 03, Question 1


;; Lab 03, Question 5

(define (airport-parking day-num)
  (+ (* (remainder day-num 7) 14.95) (* (/ (- day-num (remainder day-num 7)) 7) 74.95)))
