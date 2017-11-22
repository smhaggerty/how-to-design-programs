; Exercise 489:
; Reformulate add-to-each using map and lambda.


; Exercise 490:
; Develop a formula that describes the abstract running time of
; relative->absolute. Hint Evaluate the expression
;
;   (relative->absolute (build-list size add1))
;
; by hand. Start by replacing size with 1, 2, and 3. How many recursions of
; relative->absolute and add-to-each are required each time?


; Exercise 491:
; With a bit of design and a bit of tinkering, a friend of yours came up with
; the following solution for the sample problem:
;
;   (define (relative->absolute l)
;    (reverse
;      (foldr (lambda (f l) (cons (+ f (first l)) l))
;             (list (first l))
;             (reverse (rest l)))))
;
; This simple solution merely uses well-known ISL+ functions: reverse and
; foldr. Using lambda, as you know, is just a convenience. You may also recall
; from Abstraction that foldr is designable with the design recipes presented
; in the first two parts of the book.
;
; Does your friend’s solution mean there is no need for our complicated design
; in this motivational section? For an answer, see Recognizing the Need for an
; Accumulator, but reflect on the question first. Hint Try to design reverse
; on your own.


; Exercise 492:
; Modify the definitions in figure 169 so that the program produces #false,
; even if it encounters the same origin twice.


; Exercise 493:
; Argue that, in the terminology of Intermezzo 5: The Cost of Computation,
; invert consumes O(n2) time when the given list consists of n items.


; Exercise 494:
; Does the insertion sort> function from Auxiliary Functions that Recur need an
; accumulator? If so, why? If not, why not?


; Exercise 495:
; Complete the manual evaluation of (sum/a '(10 4) 0) in figure 183. Doing so
; shows that the sum and sum.v2 add up the given numbers in reverse order.
; While sum adds up the numbers from right to left, the accumulator-style
; version adds them up from left to right.
;
; Note on Numbers Remember that for exact numbers, this difference has no
; effect on the final result. For inexact numbers, the difference can be
; significant. See the exercises at the end of Intermezzo 5: The Cost of
; Computation.


; Exercise 496:
; What should the value of a be when n0 is 3 and n is 1? How about when n0 is
; 10 and n is 8?


; Exercise 497:
; Like sum, !.v1 performs the primitive computations, multiplication in this
; case, in reverse order. Surprisingly, this affects the performance of the
; function in a negative manner.
;
; Measure how long it takes to evaluate (!.v1 20) 1,000 times. Recall that
; (time an-expression) function determines how long it takes to run
; an-expression.


; Exercise 498:
; Complete the design of height.v3. Hint In terms of the bottom-most tree of
; figure 184, the place marked 1 has no complete paths to leafs to its left
; while the place marked 2 has one complete path and it consists of two steps.


; Exercise 499:
; Design an accumulator-style version of product, the function that computes
; the product of a list of numbers. Stop when you have formulated the
; accumulator invariant and have someone check it.
;
; The performance of product is O(n) where n is the length of the list. Does
; the accumulator version improve on this?


; Exercise 500:
; Design an accumulator-style version of how-many, which is the function that
; determines the number of items on a list. Stop when you have formulated the
; invariant and have someone check it.
;
; The performance of how-many is O(n) where n is the length of the list. Does
; the accumulator version improve on this?
;
; When you evaluate (how-many some-non-empty-list) by hand, n applications of
; add1 are pending by the time the function reaches '()—where n is the number
; of items on the list. Computer scientists sometime say that how-many needs
; O(n) space to represent these pending function applications. Does the
; accumulator reduce the amount of space needed to compute the result?


; Exercise 501:
; Design an accumulator-style version of add-to-pi. The function adds a natural
; number to pi without using +:
;
;   ; N -> Number 
;   ; adds n to pi without using +
;   (check-within (add-to-pi 2) (+ 2 pi) 0.001)
;   (define (add-to-pi n)
;     (cond
;       [(zero? n) pi]
;       [else (add1 (add-to-pi (sub1 n)))]))
;
; Stop when you have formulated the accumulator invariant and have someone
; check it.


; Exercise 502:
; Design the function palindrome, which accepts a non-empty list and constructs
; a palindrome by mirroring the list around the last item. When given (explode
; "abc"), it yields (explode "abcba").
;
; Hint Here is a solution designed by function composition:
;
;   ; [NEList-of 1String] -> [NEList-of 1String]
;   ; creates a palindrome from s0
;   (check-expect
;     (mirror (explode "abc")) (explode "abcba"))
;   (define (mirror s0)
;     (append (all-but-last s0)
;             (list (last s0))
;             (reverse (all-but-last s0))))
;
; See Auxiliary Functions that Generalize for last; design all-but-last in an
; analogous manner.
;
; This solution traverses s0 four times:
;
;   via all-but-last,
;
;   via last,
;
;   via all-but-last again, and
;
;   via reverse, which is ISL+’s version of invert.
;
; Even with local definition for the result of all-but-last, the function needs
; three traversals. While these traversals aren’t “stacked” and therefore don’t
; have a disastrous impact on the function’s performance, an accumulator
; version can compute the same result with a single traversal.


; Exercise 503:
; Exercise 467 implicitly asks for the design of a function that rotates a
; Matrix until the first coefficient of the first row differs from 0. In the
; context of Exercise 467, the solution calls for a generative-recursive
; function that creates a new matrix by shifting the first row to the end when
; it encounters a 0 in the first position. Here is the solution:
;
;   ; Matrix -> Matrix 
;   ; finds a row that doesn't start with 0 and
;   ; uses it as the first one
;   ; generative moves the first row to last place 
;   ; no termination if all rows start with 0
;   (check-expect (rotate-until.v2 '((0 4 5) (1 2 3)))
;                 '((1 2 3) (0 4 5)))
;   (define (rotate M)
;     (cond
;       [(not (= (first (first M)) 0)) M]
;       [else
;        (rotate (append (rest M) (list (first M))))]))
;
; Stop! Modify this function so that it signals an error when all rows start
; with 0.
;
; If you measure this function on large instances of Matrix, you get a
; surprising result:
;
;   rows in M    1000    2000    3000    4000    5000
;   rotate       17      66      151     272     436
;
; As the number of rows increases from 1,000 to 5,000, the time spent by rotate
; does not increase by a factor of five but by twenty.
;
; The problem is that rotate uses append, which makes a brand-new list like
; (rest M) only to add (first M) at the end. If M consists of 1,000 rows and
; the last row is the only one with a non-0 coefficient, that’s roughly
;
;   1,000 * 1,000 = 1,000,000
;
; lists. How many lists do we get if M consists of 5,000 lines?
;
; Now suppose we conjecture that the accumulator-style version is faster than
; the generative one. Here is the accumulator template for a structurally
; recursive version of rotate:
;
;   (define (rotate.v2 M0)
;     (local (; Matrix ... -> Matrix 
;             ; accumulator ...
;             (define (rotate/a M seen)
;               (cond
;                 [(empty? M) ...]
;                 [else (... (rotate/a (rest M)
;                                      ... seen ...)
;                        ...)])))
;       (rotate/a M0 ...)))
;
; The goal is to remember the first row when its leading coefficient is 0
; without using append for every recursion.
;
; Formulate an accumulator statement. Then follow the accumulator design recipe
; to complete the above function. Measure how fast it runs on a Matrix that
; consists of rows with leading 0s except for the last one. If you completed
; the design correctly, the function is quite fast.


; Exercise 504:
; Design to10. It consumes a list of digits and produces the corresponding
; number. The first item on the list is the most significant digit. Hence, when
; applied to '(1 0 2), it produces 102.

; Domain Knowledge You may recall from grade school that the result is
; determined by 1*10^2 + 0*10^1 + 2*10^0 = ((1*10 + 0)*10) + 2 = 102


; Exercise 505:
; Design the function is-prime, which consumes a natural number and returns
; #true if it is prime and #false otherwise.
;
; Domain Knowledge A number n is prime if it is not divisible by any number
; between n - 1 and 2.
;
; Hint The design recipe for N [>=1] suggests the following template:
;
;   ; N [>=1] -> Boolean
;   ; determines whether n is a prime number
;   (define (is-prime? n)
;     (cond
;       [(= n 1) ...]
;       [else (... (is-prime? (sub1 n)) ...)]))
;
; This template immediately tells you that the function forgets n, its initial
; argument as it recurs. Since n is definitely needed to determine whether n is
; divisible by (- n 1), (- n 2), and so on, you know that you need an 
; accumulator-style function.


; Exercise 506:
; Design an accumulator-style version of map.


; Exercise 507:
; Task 1 Recall the signature for foldl:
;
;   ; [X Y] [X Y -> Y] Y [List-of X] -> Y
;
; It is also the signature of f*ldl. Formulate the signature for fold/a and its
; accumulator invariant. Hint Assume that the difference between l0 and l is
; (list x1 x2 x3). What is a, then?
;
; You may also be wondering why fold/a consumes its arguments in this unusual
; order, first the accumulator and then the list. To understand the reason for
; this ordering, imagine instead that fold/a also consumes f—as the first
; argument. At this point it becomes abundantly clear that fold/a is foldl:
;
;   ; version 5
;   (define (f*ldl f i l)
;     (cond
;       [(empty? l) i]
;       [else (f*ldl f (f (first l) i) (rest l))]))
;
; Task 2 Design build-l*st using an accumulator-style approach. The function
; must satisfy the following tests:
;
;   (check-expect (build-l*st n f) (build-list n f))
;
; for any natural number n and function f.


; Exercise 508:
; Design split-structural using the structural design recipe. The function
; consumes a list of 1Strings ed and a natural number x; the former represents
; the complete string in some Editor and the latter the x-coordinate of the
; mouse click. The function produces
;
;   (make-editor p s)
;
; such that (1) p and s make up ed and (2) x is larger than the image of p and
; smaller than the image of p extended with the first 1String on s (if any).
;
; Here is the first condition expressed with an ISL+ expression:
;
;   (string=? (string-append p s) ed)
;
; The second one is
;
;   (<= (image-width (editor-text p))
;       x
;       (image-width (editor-text (append p (first s)))))
;
; assuming (cons? s).
;
; Hints (1) The x-coordinate measures the distance from the left. Hence the
; function must check whether smaller and smaller prefixes of ed fit into the
; given width. The first one that doesn’t fit corresponds to the pre field of
; the desired Editor, the remainder of ed to the post field.
;
; (2) Designing this function calls for thoroughly developing examples and
; tests. See Intervals, Enumerations, and Itemizations.


; Exercise 509:
; Design the function split. Use the accumulator design recipe to improve on
; the result of exercise 508. After all, the hints already point out that when
; the function discovers the correct split point, it needs both parts of the
; list, and one part is obviously lost due to recursion.


; Exercise 510:
; Many operating systems come with the fmt program, which can rearrange the
; words in a file so that all lines in the resulting file have a maximal width.
; As a widely used program, fmt supports a range of related functions. This
; exercise focuses on its core functionality.
;
; Design the program fmt. It consumes a natural number w, the name of an input
; file in-f, and the name of an output file out-f—in the same sense as
; read-file from the 2htdp/batch-io library. Its purpose is to read all the
; words from the in-f, to arrange these words in the given order into lines of
; maximal width w, and to write these lines to out-f.


; Exercise 511:
; Explain the scope of each binding occurrence in the above examples. Draw
; arrows from the bound to the binding occurrences.


; Exercise 512:
; Define is-var?, is-λ?, and is-app?, that is, predicates that distinguish
; variables from λ expressions and applications.
;
; Also define
;
;   λ-para, which extracts the parameter from a λ expression;
;
;   λ-body, which extracts the body from a λ expression;
;
;   app-fun, which extracts the function from an application; and
;
;   app-arg, which extracts the argument from an application.
;
; With these predicates and selectors, you basically can act as if you had
; defined a structure-oriented data representation.
;
; Design declareds, which produces the list of all symbols used as λ parameters
; in a λ term. Don’t worry about duplicate symbols.


; Exercise 513:
; Develop a data representation for the same subset of ISL+ that uses
; structures instead of lists. Also provide data representations for ex1, ex2,
; and ex3 following your data definition.


; Exercise 514:
; Make up an ISL+ expression in which x occurs both free and bound. Formulate
; it as an element of Lam. Does undeclareds work properly on your expression?


; Exercise 515:
; Consider the following expression:
;
;   (λ (*undeclared) ((λ (x) (x *undeclared)) y))
;
; Yes, it uses *undeclared as a variable. Represent it in Lam and check what
; undeclareds produces for this expression.
;
; Modify undeclareds so that it replaces a free occurrence of 'x with
;
;   (list '*undeclared 'x)
;
; and a bound one 'y with
;
;   (list '*declared 'y)
;
; Doing so unambiguously identifies problem spots, which a program development
; environment such as DrRacket can use to highlight errors.
;
; Note The trick of replacing a variable occurrence with the representation of
; an application feels awkward. If you dislike it, consider synthesizing the
; symbols '*undeclared:x and 'declared:y instead.


; Exercise 516:
; Redesign the undeclareds function for the structure-based data representation
; from exercise 513.


; Exercise 517:
; Design static-distance. The function replaces all occurrences of variables
; with a natural number that represents how far away the declaring λ is. Figure
; 188 illustrates the idea for the term
;
;   '((λ (x) (λ (y) (y x))) (λ (z) z))
;
; in graphical form. It includes dotted arrows that point from variable
; occurrences to the corresponding variable declarations. On the right, the
; figure shows a tree of the same shape, though without the arrows. The 'λ 
; nodes come without names, and variable occurrences have been replaced by
; natural numbers that specify which 'λ declares the variable. Each natural
; number n says that the binding occurrence is n steps upward—toward the root
; of the Lam tree. A value of 0 denotes the first 'λ on the path to the root, 1
; the second one, and so on.
;
; Hint The undeclareds accumulator of undeclareds/a is a list of all parameters
; on path from le to le0 in reverse order—the last one seen is first on the
; list.


; Exercise 518:
; Argue that our-cons takes a constant amount of time to compute its result,
; regardless of the size of its input.


; Exercise 519:
; Is it acceptable to impose the extra cost on cons for all programs to turn
; length into a constant-time function?


; Exercise 520:
; The solve* function generates all states reachable with n boat trips before
; it looks at states that require n + 1 boat trips, even if some of those boat
; trips return to previously encountered states. Because of this systematic way
; of traversing the tree, solve* cannot go into an infinite loop. Why?
; Terminology This way of searching a tree or a graph is dubbed breadth-first
; search. 


; Exercise 521:
; Develop a representation for the states of the missionary-and-cannibal
; puzzle. Like the graphical representation, a data representation must record
; the number of missionaries and cannibals on each side of the river plus the
; location of the boat.
;
; The description of PuzzleState calls for a new structure type. Represent the
; above initial, intermediate, and final states in your representation.
;
; Design the function final?, which detects whether in a given state all people
; are on the right river bank.
;
; Design the function render-mc, which maps a state of the 
; missionary-and-cannibal puzzle to an image.


; Exercise 522:
; Modify the representation from exercise 521 so that a state records the
; sequence of states traversed to get there. Use a list of states.
;
; Articulate and write down an accumulator statement with the data definition
; that explains the additional field.
;
; Modify final? or render-mc for this representation as needed.


; Exercise 523:
; Design the create-next-states function. It consumes lists of
; missionary-and-cannibal states and generates the list of all those states
; that a boat ride can reach.
;
; Ignore the accumulator in the first draft of create-next-states, but make
; sure that the function does not generate states where the cannibals can eat
; the missionaries.
;
; For the second design, update the accumulator field in the state structures
; and use it to rule out states that have been encountered on the way to the
; current state.


; Exercise 524:
; Exploit the accumulator-oriented data representation to modify solve. The
; revised function produces the list of states that lead from the initial
; PuzzleState to the final one.
;
; Also consider creating a movie from this list, using render-mc to generate
; the images. Use run-movie to display the movie.


; Exercise 525:
; Tackle the wish list that the skeleton implies:
;
;   ; Image Posn Posn Posn -> Image 
;   ; adds the black triangle a, b, c to scene
;   (define (add-triangle scene a b c) scene)
;
;   ; Posn Posn Posn -> Boolean 
;   ; is the triangle a, b, c too small to be divided
;   (define (too-small? a b c)
;     #false)
;
;   ; Posn Posn -> Posn 
;   ; determines the midpoint between a and b
;   (define (mid-point a b)
;     a)
;
; Design the three functions.


; Exercise 526:
; To compute the endpoints of an equilateral Sierpinski triangle, draw a circle
; and pick three points on the circle that are 120 degrees apart, for example,
; 120, 240, and 360.
;
; Design the function circle-pt:
;
;   (define CENTER (make-posn 200 200))
;   (define RADIUS 200) ; the radius in pixels 
;
;   ; Number -> Posn
;   ; determines the point on the circle with CENTER 
;   ; and RADIUS whose angle is 
;
;   ; examples
;   ; what are the x and y coordinates of the desired 
;   ; point, when given: 120/360, 240/360, 360/360
;
;   (define (circle-pt factor)
;     (make-posn 0 0))


; Exercise 527:
; Design the function add-savannah. The function consumes an image and four
; numbers: (1) the x-coordinate of a line’s base point, (2) the y-coordinate of
; a line’s base point, (3) the length of the line, and (4) the angle of the
; line. It adds a fractal Savannah tree to the given image.
;
; Unless the line is too short, the function adds the specified line to the
; image. It then divides the line into three segments. It recursively uses the
; two intermediate points as the new starting points for two lines. The lengths
; and the angles of the two branches change in a fixed manner, but
; independently of each other. Use constants to define these changes and work
; with them until you like your tree well enough.
;
; Hint Experiment with shortening each left branch by at least one third and
; rotating it left by at least 0.15 degrees. For each right branch, shorten it
; by at least 20% and rotate it by 0.2 degrees in the opposite direction.


; Exercise 528:
; Graphics programmers often need to connect two points with a smooth curve
; where “smooth” is relative to some perspective. Here is are two sketches:
;
; The left one shows a smooth curve, connecting points A and C; the right one
; supplies the perspective point, B, and the angle of an observer.
;
; One method for drawing such curves is due to Bézier. It is a prime example of
; generative recursion, and the following sequence explains the eureka! behind
; the algorithm:
;
; Consider the image on the left. It reminds you that the three given points
; determine a triangle and that the connection from A to C is the focal point
; of the algorithm. The goal is to pull the line from A to C toward B so that
; it turns into a smooth curve.
;
; Now turn to the image in the middle. It explains the essential idea of the
; generative step. The algorithm determines the midpoint on the two observer
; lines, A-B and B-C, as well as their midpoint, A-B-C.
;
; Finally, the right-most image shows how these three new points generate two
; distinct recursive calls: one deals with the new triangle on the left and the
; other one with the triangle on the right. More precisely, A-B and B-C become
; the new observer points and the lines from A to A-B-C and from C to A-B-C
; become the foci of the two recursive calls.
;
; When the triangle is small enough, we have a trivially solvable case. The
; algorithm just draws the triangle, and it appears as a point on the given
; image. As you implement this algorithm, you need to experiment with the
; notion of “small enough” to make the curve look smooth.

