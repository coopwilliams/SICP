#lang scheme

;; zeroes
(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (close-enough? x y) (< (abs (- y x)) .0001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
        (if (close-enough? neg-point pos-point)
            midpoint
            (let ((test-value (f midpoint)))
              (cond ((positive? test-value)
                    (search f neg-point midpoint))
                    ((negative? test-value)
                     (search f midpoint pos-point))
                    (else midpoint))))))
 
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (positive? a-value) (negative? b-value))
           (search f b a))
          ((and (negative? a-value) (positive? b-value))
           (search f a b))
          (else
           (error "both points have the same sign, yo." a-value b-value)))))

;; fixed points
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

;; the fixed point of which is the golden ratio
(define (1-plus-inverse x) (+ (/ 1 x) 1))

;; 1.36
(define (thousand-log x) (/ (log 1000) (log x)))

(define (fixed-point-mod f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; 1.37
(define (cont-frac-r n d k)
  (cond ((= k 1)
         (/ n d))
        ((> k 1)
         (/ n (+ d (cont-frac-r n d (- k 1)))))
        (else
         (error "k cannot be negative!!"))))

;; 1.38
(define (special? x)
  (= (modulo (+ 1 x) 3) 0))


;; doodling
(define (exp a b)
  (if (= b 1)
      a
      (* a (exp a (- b 1)))))

(define (cubic x) (+ (* 3 (exp x 3)) (* 2 x) 1))


;; test runs
(define (squarish x) (- (* x x) 25))
(search squarish -5.0 5.0)
(search square -5.0 5.0)
(half-interval-method squarish -4.0 6.0)
(half-interval-method sin 6.0 6.5)
(fixed-point cos 1.0)
(sqrt 4)
(fixed-point 1-plus-inverse 1.0)
(cont-frac-r 1.0
           1.0
           25)
(fixed-point-mod cubic -1)




                
                 