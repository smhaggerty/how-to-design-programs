; Exercise 421:
; Is (bundle '("a" "b" "c") 0) a proper use of the bundle function? What does
; it produce? Why?


; Exercise 422:
; Define the function list->chunks. It consumes a list l of arbitrary data and
; a natural number n. The function’s result is a list of list chunks of size n.
; Each chunk represents a sub-sequence of items in l.
;
; Use list->chunks to define bundle via function composition.


; Exercise 423:
; Define partition. It consumes a String s and a natural number n. The function
; produces a list of string chunks of size n.
;
; For non-empty strings s and positive natural numbers n,
;
;   (equal? (partition s n) (bundle (explode s) n))
;
; is #true. But don’t use this equality as the definition for partition; use
; substring instead.
;
; Hint Have partition produce its natural result for the empty string. For the
; case where n is 0, see exercise 421.
;
; Note The partition function is somewhat closer to what a cooperative DrRacket
; environment would need than bundle.


; Exercise 424:
; Draw a quick-sort diagram like the one in figure 148 for (list 11 9 2 18 12
; 14 4 1).


; Exercise 425:
; Articulate purpose statements for smallers and largers in figure 149.


; Exercise 426:
; Complete the hand-evaluation from above. A close inspection of the evaluation
; suggests an additional trivial case for quick-sort<. Every time quick-sort<
; consumes a list of one item, it returns it as is. After all, the sorted
; version of a list of one item is the list itself.
;
; Modify quick-sort< to take advantage of this observation. Evaluate the
; example again. How many steps does the revised algorithm save?


; Exercise 427:
; While quick-sort< quickly reduces the size of the problem in many cases, it
; is inappropriately slow for small problems. Hence people use quick-sort< to
; reduce the size of the problem and switch to a different sort function when
; the list is small enough.
;
; Develop a version of quick-sort< that uses sort< (an appropriately adapted
; variant of sort> from Auxiliary Functions that Recur) if the length of the
; input is below some threshold.


; Exercise 428:
; If the input to quick-sort< contains the same number several times, the
; algorithm returns a list that is strictly shorter than the input. Why? Fix
; the problem so that the output is as long as the input.


; Exercise 429:
; Use filter to define smallers and largers.


; Exercise 430:
; Develop a variant of quick-sort< that uses only one comparison function, say,
; <. Its partitioning step divides the given list alon into a list that
; contains the items of alon smaller than the pivot and another one with those
; that are not smaller.
;
; Use local to package up the program as a single function. Abstract this
; function so that it consumes a list and a comparison function.


; Exercise 431:
; Answer the four key questions for the bundle problem and the first three
; questions for the quick-sort< problem. How many instances of generate-problem
; are needed?


; Exercise 432:
; Exercise 219 introduces the function food-create, which consumes a Posn and
; produces a randomly chosen Posn that is guaranteed to be distinct from the
; given one. First reformulate the two functions as a single definition, using
; local; then justify the design of food-create.


; Exercise 433:
; Develop a checked version of bundle that is guaranteed to terminate for all
; inputs. It may signal an error for those cases where the original version
; loops.


; Exercise 434:
; Consider the following definition of smallers, one of the two “problem
; generators” for quick-sort<:
;
;   ; [List-of Number] Number -> [List-of Number]
;   (define (smallers l n)
;     (cond
;       [(empty? l) '()]
;       [else (if (<= (first l) n)
;                 (cons (first l) (smallers (rest l) n))
;                 (smallers (rest l) n))]))
;
; What can go wrong when this version is used with the quick-sort< definition
; from Recursion that Ignores Structure?


; Exercise 435:
; When you worked on exercise 430 or exercise 428, you may have produced
; looping solutions. Similarly, exercise 434 actually reveals how brittle the
; termination argument is for quick-sort<. In all cases, the argument relies on
; the idea that smallers and largers produce lists that are maximally as long
; as the given list, and on our understanding that neither includes the given
; pivot in the result.
;
; Based on this explanation, modify the definition of quick-sort< so that both
; functions receive lists that are shorter than the given one.


; Exercise 436:
; Formulate a termination argument for food-create from exercise 432.


; Exercise 437:
; Define solve and combine-solutions so that
;
;   special computes the length of its input,
;
;   special negates each number on the given list of numbers, and
;
;   special uppercases the given list of strings.
;
; What do you conclude from these exercises?


; Exercise 438:
; In your words: how does greatest-divisor-<= work? Use the design recipe to
; find the right words. Why does the locally defined greatest-divisor-<= recur
; on (min n m)?


; Exercise 439:
; Copy gcd-structural into DrRacket and evaluate
;
;   (time (gcd-structural 101135853 45014640))
;
; in the interactions area.


; Exercise 440:
; Copy gcd-generative into the definitions area of DrRacket and evaluate
;
;   (time (gcd-generative 101135853 45014640))
;
; in the interactions area.


; Exercise 441:
; Evaluate
;
;   (quick-sort< (list 10 6 8 9 14 12 3 11 14 16 2))
;
; by hand. Show only those lines that introduce a new recursive call to
; quick-sort<. How many recursive applications of quick-sort< are required? How
; many recursive applications of the append function? Suggest a general rule
; for a list of length n.
;
; Evaluate
;
;   (quick-sort< (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14))
;
; by hand. How many recursive applications of quick-sort< are required? How
; many recursive applications of append? Does this contradict the first part of
; the exercise?


; Exercise 442:
; Add sort< and quick-sort< to the definitions area. Run tests on the functions
; to ensure that they work on basic examples. Also develop create-tests, a
; function that creates large test cases randomly. Then explore how fast each
; works on various lists.
;
; Does the experiment confirm the claim that the plain sort< function often
; wins over quick-sort< for short lists and vice versa?
;
; Determine the cross-over point. Use it to build a clever-sort function that
; behaves like quick-sort< for large lists and like sort< for lists below this
; cross-over point. Compare with exercise 427.


; Exercise 443:
; Given the header material for gcd-structural, a naive use of the design
; recipe might use the following template or some variant:
;
;   (define (gcd-structural n m)
;     (cond
;       [(and (= n 1) (= m 1)) ...]
;       [(and (> n 1) (= m 1)) ...]
;       [(and (= n 1) (> m 1)) ...]
;       [else
;        (... (gcd-structural (sub1 n) (sub1 m)) ...
;         ... (gcd-structural (sub1 n) m) ...
;         ... (gcd-structural n (sub1 m)) ...)]))
;
; Why is it impossible to find a divisor with this strategy?


; Exercise 444:
; Exercise 443 means that the design for gcd-structural calls for some planning
; and a design-by-composition approach.
;
; The very explanation of “greatest common denominator” suggests a two-stage
; approach. First design a function that can compute the listIdeally, you
; should use sets not lists. of divisors of a natural number. Second, design a
; function that picks the largest common number in the list of divisors of n
; and the list of divisors of m. The overall function would look like this:
;
;   (define (gcd-structural S L)
;     (largest-common (divisors S S) (divisors S L)))
;
;   ; N[>= 1] N[>= 1] -> [List-of N]
;   ; computes the divisors of l smaller or equal to k
;   (define (divisors k l)
;     '())
;
;   ; [List-of N] [List-of N] -> N
;   ; finds the largest number common to both k and l
;   (define (largest-common k l)
;     1)
;
; Why do you think divisors consumes two numbers? Why does it consume S as the
; first argument in both uses?


; Exercise 445:
; Consider the following function definition:
;
;   ; Number -> Number
;   (define (poly x)
;     (* (- x 2) (- x 4)))
;
; It defines a binomial for which we can determine its roots by hand:
;
;   > (poly 2)
;   0
;   > (poly 4)
;   0
;
; Use poly to formulate a check-satisfied test for find-root.
;
; Also use poly to illustrate the root-finding process. Start with the interval
; [3,6] and tabulate the information as follows for ε = 0:
;
;   step    left    f left    right    f right    mid    f mid
;   n=1     3       -1        6.00     8.00       4.50   1.25
;   n=2     3       -1        4.50     1.25       ?      ?


; Exercise 446:
; Add the test from exercise 445 to the program in figure 159. Experiment with
; different values for ε.


; Exercise 447:
; The poly function has two roots. Use find-root with poly and an interval that
; contains both roots.


; Exercise 448:
; The find-root algorithm terminates for all (continuous) f, left, and right
; for which the assumption holds. Why? Formulate a termination argument.
;
; Hint Suppose the arguments of find-root describe an interval of size S1. How
; large is the distance between left and right for the first and second
; recursive call to find-root? After how many steps is (- right left) smaller
; than or equal to ε?


; Exercise 449:
; As presented in figure 159, find-root computes the value of f for each
; boundary value twice to generate the next interval. Use local to avoid this
; recomputation.
;
; In addition, find-root recomputes the value of a boundary across recursive
; calls. For example, (find-root f left right) computes (f left) and, if
; [left,mid] is chosen as the next interval, find-root computes (f left) again.
; Introduce a helper function that is like find-root but consumes not only left
; and right but also (f left) and (f right) at each recursive stage.
;
; How many recomputations of (f left) does this design maximally avoid? Note
; The two additional arguments to this helper function change at each recursive
; stage, but the change is related to the change in the numeric arguments.
; These arguments are so-called accumulators, which are the topic of
; Accumulators.


; Exercise 450:
; A function f is monotonically increasing if (<= (f a) (f b)) holds whenever
; (< a b) holds. Simplify find-root assuming the given function is not only
; continuous but also monotonically increasing.


; Exercise 451:
; Design find-linear. The function consumes a monotonically increasing table
; and finds the smallest index for a root of the table. Use the structural
; recipe for N, proceeding from 0 through 1, 2, and so on to the array-length
; of the given table. This kind of root-finding process is often called a
; linear search.
;
; Design find-binary, which also finds the smallest index for the root of a
; monotonically increasing table but uses generative recursion to do so. Like
; ordinary binary search, the algorithm narrows an interval down to the
; smallest possible size and then chooses the index. Don’t forget to formulate
; a termination argument.
;
; Hint The key problem is that a table index is a natural number, not a plain
; number. Hence the interval boundary arguments for find must be natural
; numbers. Consider how this observation changes (1) the nature of trivially
; solvable problem instances, (2) the midpoint computation, (3) and the
; decision as to which interval to generate next. To make this concrete,
; imagine a table with 1024 slots and the root at 1023. How many calls to find
; are needed in find-linear and find-binary, respectively?


; Exercise 452:
; Both first-line and remove-first-line are missing purpose statements.
; Articulate proper statements.


; Exercise 453:
; Design the function tokenize. It turns a Line into a list of tokens. Here a
; token is either a 1String or a String that consists of lower-case letters and
; nothing else. That is, all white-space 1Strings are dropped; all other
; non-letters remain as is; and all consecutive letters are bundled into
; “words.” Hint Read up on the string-whitespace? function.


; Exercise 454:
; Design create-matrix. The function consumes a number n and a list of n2
; numbers. It produces an image matrix, for example:
;
;   (check-expect
;     (create-matrix 2 (list 1 2 3 4))
;     (list (list 1 2)
;           (list 3 4)))
;
; Make up a second example.


; Exercise 455:
; Translate this mathematical formula into the ISL+ function slope, which maps
; function f and a number r1 to the slope of f at r1. Assume that ε is a global
; constant. For your examples, use functions whose exact slope you can figure
; out, say, horizontal lines, linear functions, and perhaps polynomials if you
; know some calculus.


; Exercise 456:
; Design root-of-tangent, a function that maps f and r1 to the root of the
; tangent through (r1,(f r1)).


; Exercise 457:
; Design the function double-amount, which computes how many months it takes to
; double a given amount of money when a savings account pays interest at a
; fixed rate on a monthly basis.
;
; Domain Knowledge With a minor algebraic manipulation, you can show that the
; given amount is irrelevant. Only the interest rate matters. Also domain
; experts know that doubling occurs after roughly 72/r month as long as the
; interest rate r is “small.”


; Exercise 458:
; Kepler suggested a simple integration method. To compute an estimate of the
; area under f between a and b, proceed as follows:
;
;   divide the interval into half at mid = (a + b) / 2;
;
;   compute the areas of these two trapezoids:
;
;       [(a,0),(a,f(a)),(mid,0),(mid,f(mid))]
;
;       [(mid,0),(mid,f(mid)),(b,0),(b,f(b))];
;
;   then add the two areas.
; Design the function integrate-kepler. That is, turn the mathematical
; knowledge into an ISL+ function. Adapt the test cases from figure 165 to this
; use. Which of the three tests fails and by how much?


; Exercise 459:
; Turn the description of the process into an ISL+ function. Adapt the test
; cases from figure 165 to this case.
;
; The more rectangles the algorithm uses, the closer its estimate is to the
; actual area. Make R a top-level constant and increase it by factors of 10
; until the algorithm’s accuracy eliminates problems with an ε value of 0.1.
;
; Decrease ε to 0.01 and increase R enough to eliminate any failing test cases
; again. Compare the result to exercise 458.


; Exercise 460:
; Develop the algorithm integrate-dc, which integrates a function f between the
; boundaries a and b using a divide-and-conquer strategy. Use Kepler’s method
; when the interval is sufficiently small.


; Exercise 461:
; Design integrate-adaptive. That is, turn the recursive process description
; into an ISL+ algorithm. Make sure to adapt the test cases from figure 165 to
; this use.
;
; Do not discuss the termination of integrate-adaptive.
;
; Does integrate-adaptive always compute a better answer than either
; integrate-kepler or integrate-rectangles? Which aspect is integrate-adaptive
; guaranteed to improve?


; Exercise 462:
; Design the function check-solution. It consumes an SOE and a Solution. Its
; result is #true if plugging in the numbers from the Solution for the
; variables in the Equations of the SOE produces equal left-hand-side values
; and right-hand-side values; otherwise the function produces #false. Use
; check-solution to formulate tests with check-satisfied.
;
; Hint Design the function plug-in first. It consumes the left-hand side of an
; Equation and a Solution and calculates out the value of the left-hand side
; when the numbers from the solution are plugged in for the variables.


; Exercise 463:
; Check that the following system of equations
;   2*x + 2*y + 3*z =  10
;         3*y + 9*z =  21
;               1*z =  2
; has the same solution as the one labeled with (image). Do so by hand and with
; check-solution from exercise 462.


; Exercise 464:
; Check that the following system of equations
;
;   2*x + 2*y + 3*z =  10
;         3*y + 9*z =  21
;        -3*y - 8*z = -19
;
; has the same solution as the one labeled with (t). Again do so by hand and
; with check-solution from exercise 462.


; Exercise 465:
; Design subtract. The function consumes two Equations of equal length. It
; “subtracts” a multiple of the second equation from the first, item by item,
; so that the resulting Equation has a 0 in the first position. Since the
; leading coefficient is known to be 0, subtract returns the rest of the list
; that results from the subtractions.


; Exercise 466:
; Here is a representation for triangular SOEs:
;
;   ; A TM is an [NEList-of Equation]
;   ; such that the Equations are of decreasing length: 
;   ;   n + 1, n, n - 1, ..., 2. 
;   ; interpretation represents a triangular matrix
;
; Design the triangulate algorithm:
;
;   ; SOE -> TM
;   ; triangulates the given system of equations 
;   (define (triangulate M)
;     '(1 2))
;
; Turn the above example into a test and spell out explicit answers for the
; four questions based on our loose description.
;
; Do not yet deal with the termination step of the design recipe.


; Exercise 467:
; Revise the algorithm triangulate from exercise 466 so that it rotates the
; equations first to find one with a leading coefficient that is not 0 before
; it subtracts the first equation from the remaining ones.
;
; Does this algorithm terminate for all possible system of equations?
;
; Hint The following expression rotates a non-empty list L:
;
;   (append (rest L) (list (first L)))
;
; Explain why.


; Exercise 468:
; Modify triangulate from exercise 467 so that it signals an error if it
; encounters an SOE whose leading coefficients are all 0.


; Exercise 469:
; Design the solve function. It consumes triangular SOEs and produces a solution.
;
; Hint Use structural recursion for the design. Start with the design of a
; function that solves a single linear equation in n+1 variables, given a
; solution for the last n variables. In general, this function plugs in the
; values for the rest of the left-hand side, subtracts the result from the
; right-hand side, and divides by the first coefficient. Experiment with this
; suggestion and the above examples.
;
; Challenge Use an existing abstraction and lambda to design solve.


; Exercise 470:
; Define gauss, which combines the triangulate function from exercise 468 and
; the solve function from exercise 469.


; Exercise 471:
; Translate one of the above definitions into proper list form using list and
; proper symbols.
;
; The data representation for nodes is straightforward:
;
;   ; A Node is a Symbol.
;
; Formulate a data definition to describe the class of all Graph
; representations, allowing an arbitrary number of nodes and edges. Only one of
; the above representations has to belong to Graph.
;
; Design the function neighbors. It consumes a Node n and a Graph g and
; produces the list of immediate neighbors of n in g.


; Exercise 472:
; Test find-path. Use the function to find a path from 'A to 'G in
; sample-graph. Which one does it find? Why?
;
; Design test-on-all-nodes, a function that consumes a graph g and determines
; whether there is a path between any pair of nodes.


; Exercise 473:
; Test find-path on 'B, 'C, and the graph in figure 170. Also use
; test-on-all-nodes from exercise 472 on this graph.


; Exercise 474:
; Redesign the find-path program as a single function.


; Exercise 475:
; Redesign find-path/list so that it uses an existing list abstraction from
; figures 95 and 96 instead of explicit structural recursion. Hint Read the
; documentation for Racket’s ormap. How does it differ from ISL+’s ormap
; function? Would the former be helpful here?


; Exercise 476:
; Finite State Machines poses a problem concerning finite state machines and
; strings but immediately defers to this chapter because the solution calls for
; generative recursion. You have now acquired the design knowledge needed to
; tackle the problem.
;
; Design the function fsm-match. It consumes the data representation of a
; finite state machine and a string. It produces #true if the sequence of
; characters in the string causes the finite state machine to transition from
; an initial state to a final state.
;
; Since this problem is about the design of generative recursive functions, we
; provide the essential data definition and a data example:
;
;   (define-struct transition [current key next])
;   (define-struct fsm [initial transitions final])
;    
;   ; An FSM is a structure:
;   ;   (make-fsm FSM-State [List-of 1Transition] FSM-State)
;   ; A 1Transition is a structure:
;   ;   (make-transition FSM-State 1String FSM-State)
;   ; An FSM-State is String.
;    
;   ; data example: see exercise 109
;    
;   (define fsm-a-bc*-d
;     (make-fsm
;      "AA"
;      (list (make-transition "AA" "a" "BC")
;            (make-transition "BC" "b" "BC")
;            (make-transition "BC" "c" "BC")
;            (make-transition "BC" "d" "DD"))
;      "DD"))
;
; The data example corresponds to the regular expression a (b|c)* d. As
; mentioned in exercise 109, "acbd", "ad", and "abcd" are examples of
; acceptable strings; "da", "aa", or "d" do not match.
;
; In this context, you are designing the following function:
;
;   ; FSM String -> Boolean 
;   ; does an-fsm recognize the given string
;   (define (fsm-match? an-fsm a-string)
;     #false)
;
; Hint Design the necessary auxiliary function locally to the fsm-match?
; function. In this context, represent the problem as a pair of parameters: the
; current state of the finite state machine and the remaining list of 1Strings.


; Exercise 477:
; Inspect the function definition of arrangements in figure 171. The figure
; displays a generative-recursive solution of the extended design problem
; covered by Word Games, the Heart of the Problem, namely
;
;   given a word, create all possible rearrangements of the letters.
;
; The extended exercise is a direct guide to the structurally recursive design
; of the main function and two auxiliaries, where the design of the latter
; requires the creation of two more helper functions. In contrast, figure 171
; uses the power of generative recursion—plus foldr and map—to define the same
; program as a single function definition.
;
; Explain the design of the generative-recursive version of arrangements.
; Answer all questions that the design recipe for generative recursion poses,
; including the question of termination.
;
; Does arrangements in figure 171 create the same lists as the solution of Word
; Games, the Heart of the Problem?


; Exercise 478:
; You can also place the first queen in all squares of the top-most row, the
; right-most column, and the bottom-most row. Explain why all of these
; solutions are just like the three scenarios depicted in figure 173.
;
; This leaves the central square. Is it possible to place even a second queen
; after you place one on the central square of a 3 by 3 board?


; Exercise 479:
; Design the threatening? function. It consumes two QPs and determines whether
; queens placed on the two respective squares would threaten each other.
;
; Domain Knowledge (1) Study figure 172. The queen in this figure threatens all
; squares on the horizontal, the vertical, and the diagonal lines. Conversely,
; a queen on any square on these lines threatens the queen.
;
; (2) Translate your insights into mathematical conditions that relate the
; squares’ coordinates to each other. For example, all squares on a horizontal
; have the same y-coordinate. Similarly, all squares on one diagonal have
; coordinates whose sums are the same. Which diagonal is that? For the other
; diagonal, the differences between the two coordinates remain the same. Which
; diagonal does this idea describe?
;
; Hint Once you have figured out the domain knowledge, formulate a test suite
; that covers horizontals, verticals, and diagonals. Don’t forget to include
; arguments for which threatening? must produce #false.


; Exercise 480:
; Design render-queens. The function consumes a natural number n, a list of
; QPs, and an Image. It produces an image of an n by n chess board with the
; given image placed according to the given QPs.
;
; You may wish to look for an image for a chess queen on-line or create a
; simplistic one with the available image functions.


; Exercise 481:
; The tests in figure 175 are awful. No real-world programmer ever spells out
; all these possible outcomes.
;
; One solution is to use property testing again. Design the n-queens-solution?
; function, which consumes a natural number n and produces a predicate on queen
; placements that determines whether a given placement is a solution to an n
; queens puzzle:
;
;   A solution for an n queens puzzle must have length n.
;
;   A QP on such a list may not threaten any other, distinct QP.
;
; Once you have tested this predicate, use it and check-satisfied to formulate
; the tests for n-queens.
;
; An alternative solution is to understand the lists of QPs as sets. If two
; lists contain the same QPs in different order, they are equivalent as the
; figure suggests. Hence you could formulate the test for n-queens as
;
;   ; [List-of QP] -> Boolean
;   ; is the result equal [as a set] to one of two lists
;   (define (is-queens-result? x)
;     (or (set=? 4QUEEN-SOLUTION-1 x)
;         (set=? 4QUEEN-SOLUTION-2 x)))
;
; Design the function set=?. It consumes two lists and determines whether they
; contain the same items—regardless of order.


; Exercise 482:
; The key idea to is to design a function that places n queens on a chess board
; that may already contain some queens:
;
;   ; Board N -> [Maybe [List-of QP]]
;   ; places n queens on board; otherwise, returns #false
;   (define (place-queens a-board n)
;     #false)
;
; Figure 175 already refers to this function in the definition of n-queens.
;
; Design the place-queens algorithm. Assume you have the following functions
; to deal with Boards:
;
;   ; N -> Board 
;   ; creates the initial n by n board
;   (define (board0 n) ...)
;
;   ; Board QP -> Board 
;   ; places a queen at qp on a-board
;   (define (add-queen a-board qp)
;     a-board)
;
;   ; Board -> [List-of QP]
;   ; finds spots where it is still safe to place a queen
;   (define (find-open-spots a-board)
;     '())
;
; The first function is used in figure 175 to create the initial board
; representation for place-queens. You will need the other two to describe the
; generative steps for the algorithm.


; Exercise 483:
; Develop a data definition for Board and design the three functions specified
; in exercise 482. Consider the following ideas:
;
;   a Board collects those positions where a queen can still be placed;
;
;   a Board contains the list of positions where a queen has been placed;
;
;   a Board is a grid of n by n squares, each possibly occupied by a queen. Use
;   a structure with three fields to represent a square: one for x, one for y,
;   and a third one saying whether the square is threatened.
;
; Use one of the above ideas to solve this exercise.
;
; Challenge Use all three ideas to come up with three different data
; representations of Board. Abstract your solution to exercise 482 and confirm
; that it works with any of your data representations of Board.

