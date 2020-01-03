#lang racket

(define (list-red items n)
  (cond [(= n 0) (car items)])
  (list-ref (cdr items) (- n 1)))

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(define thing (list 1 2 3 4))
(last-pair thing)

(define (reverse items)
  (

