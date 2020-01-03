#lang racket

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (cond [(= (upper-bound y) 0) (error "can't divide by zero!")]
         [(= (lower-bound y) 0) (error "can't divide by zero!")]
         [(= (lower-bound y) (upper-bound y)) (error "interval is zero!")])
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
(define (sub-interval x y)
  (make-interval (abs (- (lower-bound x) (lower-bound y)))
                 (abs (- (upper-bound x) (upper-bound y)))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (cdr i) (car i)) 2))
(define (width i)
  (/ (- (cdr i) (car i)) 2))
(define (make-center-percent c t)
  (cond [(= t 0) (make-interval c t)])
  (make-interval c (* c t 2)))


(define test1 (make-interval 2 3))
(define test2 (make-interval 0 1))
(define test3 (make-interval 2 2))
(define toltest1 (make-center-percent 2 0.5))
(define toltest2 (make-center-percent 3 0.1))

(div-interval test2 test1)

