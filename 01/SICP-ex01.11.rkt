#lang scheme

; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-3) if n >= 3

; recursive process:
(define (recur n)
  (if (< n 3) n
      (+ (recur (- n 1))
         (* 2 (recur (- n 3))))))

; iterative process:
(define (iter n)
  (