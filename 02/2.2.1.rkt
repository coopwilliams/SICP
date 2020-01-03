#lang racket

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (last-pair list1)
  (append (list 5 4) (list)))
(last-pair (list 23 73 149 34))
