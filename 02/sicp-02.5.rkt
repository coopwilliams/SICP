#lang scheme

(define (factor-out g f)
    (cond
      [(eq? (/ g f) 0) 0]
      [(eq? (modulo g f) 0) (factor-out (/ g f) f)]
      [else (remainder g f)]
      ))

(factor-out 36 3)

;; this does not work.