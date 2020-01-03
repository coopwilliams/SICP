#lang racket

(define (make-rat n d)
  (cond
    [( > (* n d) 0) (cons (abs n) (abs d))]
    [( < (* n d) 0) (cons (- 0 (abs n)) (abs d))]))
(define (numer x ) (car x))
(define (denom x ) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

; (define (make-point x y) (cons x y))
; (define (x-point x) (car x))
; (define (y-point x) (cdr x))
(define (make-segment x1 y1 x2 y2)
  (cons (make-point x1 y1) (make-point x2 y2)))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))
(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))
(define (midpoint-segment x)
  (make-point (/
               (+
                (x-point (start-segment x))
                (x-point (end-segment x)))
               2)
              (/
               (+
                (y-point (start-segment x))
                (y-point (end-segment x)))
               2)
              )
  )
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;(define (cons x y)
 ; (lambda (m) (m x y)))
;(define (car z)
 ; (z (lambda (p q) p)))

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))



;; 4?
(lambda (f)
  (lambda (x)
    (f (f (f (f x))))))