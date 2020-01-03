#lang scheme

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 2))
(cdr (cons 1 2))

(define (doink x y)
  (lambda (f) (f x y)))

(car (car (cons (cons 4 4) (cons 3 3))))