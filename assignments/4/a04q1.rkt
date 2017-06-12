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

(define-struct staff (somePerson))

(define (branchOfStaff staffPerson)
	(cond
		[(manager? staffPerson) (manager-branch staffPerson)]
		
		[(supervisor? staffPerson) (supervisor-branch staffPerson)]		
	)
)

(define (same-branch? st1 st2)
	(cond
		[(equal? (branchOfStaff st1) (branchOfStaff st2)) true]
		[else false]
	)
)

(define man1 (make-manager "Joe Clarke" "Company 1" 'finance))
(define sup1 (make-supervisor "Trish Lego" "Company 1" 'finance))
(define man2 (make-manager "Bill Lewis" "Company 1" 'sales))

(same-branch? man1 sup1)
(same-branch? sup1 man2)
