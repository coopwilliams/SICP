#lang scheme

(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x (* 2 h)))
  (* (/ h 3) (+ (f a)
                (f (+ a (* n h)))
                (* 4 (sum f (+ a h) add-2h b))
                (* 2 (sum f (add-2h a) add-2h (- b h)))
                )
     )
  )

            

