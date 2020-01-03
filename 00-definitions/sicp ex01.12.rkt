#lang scheme

(define (triangular x)
  (/ (* x (+ x 1)) 2))
(define (find-row x)
  (if ((> x (triangular 1)


(define (pascal x)
  (cond ((< x 5) 1)