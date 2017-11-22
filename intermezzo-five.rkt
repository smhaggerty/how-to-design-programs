; Exercise 484:
; While a list sorted in descending order is clearly the worst possible input
; for inf, the analysis of inf’s abstract running time explains why the rewrite
; of inf with local reduces the running time. For convenience, we replicate
; this version here:
;
;   (define (infL l)
;     (cond
;       [(empty? (rest l)) (first l)]
;       [else (local ((define s (infL (rest l))))
;               (if (< (first l) s) (first l) s))]))
;
; Hand-evaluate (infL (list 3 2 1 0)). Then argue that infL uses on the “order
; of n steps” in the best and the worst case. You may now wish to revisit
; exercise 261, which asks you to explore a similar problem.


; Exercise 485:
; A number tree is either a number or a pair of number trees. Design sum-tree,
; which determines the sum of the numbers in a tree. What is its abstract
; running time? What is an acceptable measure of the size of such a tree? What
; is the worst possible shape of the tree? What’s the best possible shape?


; Exercise 486:
; In the first subsection, we stated that the function f(n) = n2 + n belongs to
; the class O(n2). Determine the pair of numbers c and bigEnough that verify
; this claim.


; Exercise 487:
; Consider the functions f(n) = 2n and g(n) = 1000 n. Show that g belongs to
; O(f), which means that f is, abstractly speaking, more (or at least equally)
; expensive than g. If the input size is guaranteed to be between 3 and 12,
; which function is better?


; Exercise 488:
Compare f(n) = nlog(n) and g(n) = n^2 Does f belong to O(g) or g to O(f)?

