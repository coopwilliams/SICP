#lang scheme

(define (count-change amount)
  (define (cc amount number-coins)
    (cond ((= amount 0) 1)
          ((or (= number-coins 0) (< amount 0)) 0)
          (else (+ (cc amount
                  (- number-coins 1))
                   (cc (- amount
                      (first-denomination number-coins))
                      number-coins)))))
  (define (first-denomination number-coins)
    (cond ((= number-coins 1) 1)
          ((= number-coins 2) 5)
          ((= number-coins 3) 10)
          ((= number-coins 4) 25)
          ((= number-coins 5) 50)))

  (cc amount 5))