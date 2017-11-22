; Exercise 412:
;  Design inex+. The function adds two Inex representations of numbers that
; have the same exponent. The function must be able to deal with inputs that
; increase the exponent. Furthermore, it must signal its own error if the
; result is out of range, not rely on create-inex for error checking.
;
; Challenge Extend inex+ so that it can deal with inputs whose exponents differ
; by 1:
;
;   (check-expect
;     (inex+ (create-inex 1 1 0) (create-inex 1 -1 1))
;     (create-inex 11 -1 1))
;
; Do not attempt to deal with larger classes of inputs than that without
; reading the following subsection.


; Exercise 413:
; Design inex*. The function multiplies two Inex representations of numbers,
; including inputs that force an additional increase of the output’s exponent.
; Like inex+, it must signal its own error if the result is out of range, not
; rely on create-inex to perform error checking.


; Exercise 414:
; As this section illustrates, gaps in the data representation lead to
; round-off errors when numbers are mapped to Inexes. The problem is, such
; round-off errors accumulate across computations.
;
; Design add, a function that adds up n copies of #i1/185. For your examples,
; use 0 and 1; for the latter, use a tolerance of 0.0001. What is the result
; for (add 185)? What would you expect? What happens if you multiply the result
; with a large number?
;
; Design sub. The function counts how often 1/185 can be subtracted from the
; argument until it is 0. Use 0 and 1/185 for your examples. What are the
; expected results? What are the results for (sub 1) and (sub #i1.0)? What
; happens in the second case? Why?


; Exercise 415:
; ISL+ uses +inf.0 to deal with overflow. Determine the integer n such that
;
;   (expt #i10.0 n)
;
; is an inexact number while (expt #i10. (+ n 1)) is approximated with +inf.0.
; Hint Design a function to compute n.


; Exercise 416:
; ISL+ uses #i0.0 to approximate underflow. Determine the smallest integer n
; such that (expt #i10.0 n) is still an inexact ISL+ number and
; (expt #i10. (- n 1)) is approximated with 0. Hint Use a function to compute
; n. Consider abstracting over this function and the solution of exercise 415.


; Exercise 417:
; Evaluate (expt 1.001 1e-12) in Racket and in ISL+. Explain what you see.


; Exercise 418:
; Design my-expt without using expt. The function raises the first given number
; to the power of the second one, a natural number. Using this function,
; conduct the following experiment. Add
;
;   (define inex (+ 1 #i1e-12))
;   (define exac (+ 1 1e-12))
;
; to the definitions area. What is (my-expt inex 30)? And how about
; (my-expt exac 30)? Which answer is more useful?


; Exercise 419:
; When you add two inexact numbers of vastly different orders of magnitude, you
; may get the larger one back as the result. For example, if a number system
; uses only 15 significant digits, we run into problems when adding numbers
; that vary by more than a factor of image:
;
;   1.0 * (expt 10 16) + 1 = 1.00000000000000001 * (expt 10 16)
;
; but the closest representable answer is image.
;
; At first glance, this approximation doesn’t look too bad. Being wrong by one
; part in image (ten million billion) is close enough to the truth.
; Unfortunately, this kind of problem can add up to huge problems. Consider the
; list of numbers in figure 144 and determine the values of these expressions:
;
;   (sum JANUS)
;
;   (sum (reverse JANUS))
;
;   (sum (sort JANUS <))
;
; Assuming sum adds the numbers in a list from left to right, explain what
; these expressions compute. What do you think of the results?
;
; Generic advice on inexact calculations tells programmers to start additions
; with the smallest numbers. While adding a big number to two small numbers
; might yield the big one, adding small numbers first creates a large one,
; which might change the outcome:
;
;   > (expt 2 #i53.0)
;
;   #i9007199254740992.0
;   > (sum (list #i1.0 (expt 2 #i53.0)))
;
;   #i9007199254740992.0
;   > (sum (list #i1.0 #i1.0 (expt 2 #i53.0)))
;
;   #i9007199254740994.0
;
; This trick may not work; see the JANUS interactions above.
;
; In a language such as ISL+, you can convert the numbers to exact rationals,
; use exact arithmetic on those, and convert the result back:
;
;   (exact->inexact (sum (map inexact->exact JANUS)))
;
; Evaluate this expression and compare the result to the three sums above. What
; do you think now about advice from the web?


; Exercise 420:
; ANUS is just a fixed list, but take a look at this function:
;
;   (define (oscillate n)
;     (local ((define (O i)
;               (cond
;                 [(> i n) '()]
;                 [else
;                  (cons (expt #i-0.99 i) (O (+ i 1)))])))
;       (O 1)))
;
; Applying oscillate to a natural number n produces the first n elements of a
; mathematical series. It is best understood as a graph, like the one in figure
; 145. Run (oscillate 15) in DrRacket and inspect the result.
;
; Summing its results from left to right computes a different result than from
; right to left:
;
;   > (sum (oscillate #i1000.0))
;
;   #i-0.49746596003269394
;   > (sum (reverse (oscillate #i1000.0)))
;
;   #i-0.4974659600326953
;
; Again, the difference may appear to be small until we see the context:
;
;   > (- (* 1e+16 (sum (oscillate #i1000.0)))
;        (* 1e+16 (sum (reverse (oscillate #i1000.0)))))
;
;   #i14.0
;
; Can this difference matter? Can we trust computers?

