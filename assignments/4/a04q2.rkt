;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))


;; Question 2

(define (posnOverlap? p1 p2)
	(cond
		[(equal? (posn-x p1) (posn-x p2))
			
			(cond
				[(equal? (posn-y p1) (posn-y p2)) true]
				[else false]
			)
		]
		[else false]
	)
)




(define-struct triangle (p1 p2 p3))
;; A Triangle is a (make-triangle Posn Posn Posn)



(define (calculateTriangleArea tr)
	(* 0.5 (+ (* (posn-x (triangle-p1 tr)) (- (posn-y (triangle-p2 tr)) (posn-y (triangle-p3 tr)))) (* (posn-x (triangle-p2 tr)) (- (posn-y (triangle-p3 tr)) (posn-y (triangle-p1 tr)))) (* (posn-x (triangle-p3 tr)) (- (posn-y (triangle-p1 tr)) (posn-x (triangle-p2 tr)))) ))
)

(define (triangleAreaNonZero tr)
	(cond
		
		[(equal? 0 (calculateTriangleArea tr)) false]
		[else true]
		
	)
)


(define (valid-triangle? tr)
	
	(cond
		[(posnOverlap? (triangle-p1 tr) (triangle-p2 tr)) false]
		[else
			(cond
			
				[(posnOverlap? (triangle-p2 tr) (triangle-p3 tr)) false]
				
				[else
					(cond
						[(posnOverlap? (triangle-p1 tr) (triangle-p3 tr)) false]
						[else
							(triangleAreaNonZero tr)
						]
					)
				]
			
			)
		]
	)

)


(define p1 (make-posn 2 3))
(define p2 (make-posn 8 3))
(define p3 (make-posn 8 12))
(define p4 (make-posn 2 3))


(posnOverlap? p1 p2)
(posnOverlap? p1 p4)

(valid-triangle? (make-triangle p1 p2 p3))
(valid-triangle? (make-triangle p1 p2 p4))
