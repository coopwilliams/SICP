#lang scheme

(define (factorial x)
  (if(> (- x 1) 0)
     (* x (factorial (- x 1)))
     x))

(define (fact2 x)
  (define (iter product counter)
    (if (> counter x)
        product
        (iter (* product counter)
              (+ counter 1))))
  (iter 1 1))

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (h x)
  (A 2 x))




