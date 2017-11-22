; Exercise 300:
; Here is a simple ISL+ program:
;
;   (define (p1 x y)
;     (+ (* x y)
;        (+ (* 2 x)
;           (+ (* 2 y) 22))))
;
;   (define (p2 x)
;     (+ (* 55 x) (+ x 11)))
;
;   (define (p3 x)
;     (+ (p1 x 0)
;        (+ (p1 x 1) (p2 x))))
;
; Draw arrows from p1’s x parameter to all its bound occurrences. Draw arrows
; from p1 to all bound occurrences of p1. Check the results with DrRacket’s
; CHECK SYNTAX functionality.


; Exercise 301:
; Draw a box around the scope of each binding occurrence of sort and alon in
; figure 105. Then draw arrows from each occurrence of sort to the appropriate
; binding occurrence. Now repeat the exercise for the variant in figure 106. Do
; the two functions differ other than in name?


; Exercise 302:
; Recall that each occurrence of a variable receives its value from its binding
; occurrence. Consider the following definition:
;
;   (define x (cons 1 x))
;
; Where is the shaded occurrence of x bound? Since the definition is a constant
; definition and not a function definition, we need to evaluate the right-hand
; side immediately. What should be the value of the right-hand side according
; to our rules?


; Exercise 303:
; Draw arrows from the shaded occurrences of x to their binding occurrences in
; each of the following three lambda expressions:
;
;       (lambda (x y)
;         (+ x (* x y)))
;
;       (lambda (x y)
;         (+ x
;            (local ((define x (* y y)))
;              (+ (* 3 x)
;                 (/ 1 x)))))
;
;       (lambda (x y)
;         (+ x
;            ((lambda (x)
;               (+ (* 3 x)
;                  (/ 1 x)))
;             (* y y))))
;
; Also draw a box for the scope of each shaded x and holes in the scope as
; necessary.


; Exercise 304:
; Evaluate
;
;   (for/list ([i 2] [j '(a b)]) (list i j))
;
; and
;
;   (for*/list ([i 2] [j '(a b)]) (list i j))
;
; in the interactions area of DrRacket.


; Exercise 305:
; Use loops to define convert-euro. See exercise 267.


; Exercise 306:
; Use loops to define a function that
;
;   creates the list (list 0 ... (- n 1)) for any natural number n;
;
;   creates the list (list 1 ... n) for any natural number n;
;
;   creates the list (list 1 1/2 ... 1/n) for any natural number n;
;
;   creates the list of the first n even numbers; and
;
;   creates a diagonal square of 0s and 1s; see exercise 262.
;
; Finally, use loops to define tabulate from exercise 250.


; Exercise 307:
; Define find-name. The function consumes a name and a list of names. It
; retrieves the first name on the latter that is equal to, or an extension of,
; the former.
;
; Define a function that ensures that no name on some list of names exceeds
; some given width. Compare with exercise 271.


; Exercise 308:
; Design the function replace, which substitutes the area code 713 with 281 in
; a list of phone records.


; Exercise 309:
; Design the function words-on-line, which determines the number of Strings per
; item in a list of list of strings.

