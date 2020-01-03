#lang scheme
(define (sum-of-two-larger x y z )
  (+
   (*
    (cond((and (< x y)(< x z)) z)
         ((and (< y x)(< y z)) x)
         (else y))
    (cond((and (< x y)(< x z)) z)
         ((and (< y x)(< y z)) x)
         (else y))
    )
   (*
    (cond((and (< x y)(< x z)) y)
         ((and (< y x)(< y z)) z)
         (else x))
    (cond((and (< x y)(< x z)) y)
         ((and (< y x)(< y z)) z)
         (else x))
  )
  )
  )
(sum-of-two-larger 1 3 2)