; Exercise 235:
; Use the contains? function to define functions that search for "atom",
; "basic", and "zoo", respectively.


; Exercise 236:
; Create test suites for the following two functions:
;
;   ; Lon -> Lon                  ; Lon -> Lon
;   ; adds 1 to each item on l    ; adds 5 to each item on l
;   (define (add1* l)             (define (plus5 l)
;     (cond                         (cond
;       [(empty? l) '()]              [(empty? l) '()]
;       [else                         [else
;        (cons                         (cons
;          (add1 (first l))              (+ (first l) 5)
;          (add1* (rest l)))]))          (plus5 (rest l)))]))                 
;
; Then abstract over them. Define the above two functions in terms of the
; abstraction as one-liners and use the existing test suites to confirm that
; the revised definitions work properly. Finally, design a function that
; subtracts 2 from each number on a given list.


; Exercise 237:
; Evaluate (squared>? 3 10) and (squared>? 4 10) in DrRacket. How about
; (squared>? 5 10)?


; Exercise 238:
; Abstract the two functions in figure 89 into a single function. Both consume
; non-empty lists of numbers (Nelon) and produce a single number. The left one
; produces the smallest number in the list, and the right one the largest.
;
; Define inf-1 and sup-1 in terms of the abstract function. Test them with
; these two lists:
;
;   (list 25 24 23 22 21 20 19 18 17 16 15 14 13
;         12 11 10 9 8 7 6 5 4 3 2 1)
;
;   (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
;         17 18 19 20 21 22 23 24 25)
;
; Why are these functions slow on some of the long lists?
;
; Modify the original functions with the use of max, which picks the larger of
; two numbers, and min, which picks the smaller one. Then abstract again,
; define inf-2 and sup-2, and test them with the same inputs again. Why are
; these versions so much faster?
;
; For another answer to these questions, see Local Definitions.


; Exercise 239:
; A list of two items is another frequently used form of data in ISL
; programming. Here is a data definition with two parameters:
;
;   ; A [List X Y] is a structure: 
;   ;   (cons X (cons Y '()))
;
; Instantiate this definition to describe the following classes of data:
;
;   pairs of Numbers,
;
;   pairs of Numbers and 1Strings, and
;
;   pairs of Strings and Booleans.
;
; Also make one concrete example for each of these three data definitions.


; Exercise 240:
; Here are two strange but similar data definitions:
;
;   ; An LStr is one of:    ; An LNum is one of: 
;   ; – String              ; – Number
;   ; – (make-layer LStr)   ; – (make-layer LNum)
;
; Both data definitions rely on this structure-type definition:
;
;   (define-struct layer [stuff])
;
; Both define nested forms of data: one is about numbers and the other about
; strings. Make examples for both. Abstract over the two. Then instantiate the
; abstract definition to get back the originals.


; Exercise 241:
; Compare the definitions for NEList-of-temperatures and NEList-of-Booleans.
; Then formulate an abstract data definition NEList-of.


; Exercise 242:
; Here is one more parametric data definition:
;
;   ; A [Maybe X] is one of: 
;   ; – #false 
;   ; – X
;
; Interpret these data definitions: [Maybe String], [Maybe [List-of String]],
; and [List-of [Maybe String]].
;
; What does the following function signature mean:
;
;   ; String [List-of String] -> [Maybe [List-of String]]
;   ; returns the remainder of los starting with s 
;   ; #false otherwise 
;   (check-expect (occurs "a" (list "b" "a" "d" "e"))
;                 (list "d" "e"))
;   (check-expect (occurs "a" (list "b" "c" "d")) #f)
;   (define (occurs s los)
;     los)
;
; Work through the remaining steps of the design recipe.


; Exercise 243:
; Assume the definitions area in DrRacket contains
;
;   (define (f x) x)
;
; Identify the values among the following expressions:
;
;   (cons f '())
;
;   (f f)
;
;   (cons f (cons 10 (cons (f 10) '())))
;
; Explain why they are (not) values.


; Exercise 244:
; Argue why the following sentences are now legal:
;
;   (define (f x) (x 10))
;
;   (define (f x) (x f))
;
;   (define (f x y) (x 'a y 'b))
;
; Explain your reasoning.


; Exercise 245:
; Develop the function=at-1.2-3-and-5.775? function. Given two functions from
; numbers to numbers, the function determines whether the two produce the same
; results for 1.2, 3, and -5.775.
; 
; Mathematicians say that two functions are equal if they compute the same
; result when given the same input—for all possible inputs.
; 
; Can we hope to define function=?, which determines whether two functions from
; numbers to numbers are equal? If so, define the function. If not, explain why
; and consider the implication that you have encountered the first easily
; definable idea for which you cannot define a function.


; Exercise 246:
; Check step 1 of the last calculation
;
;   (extract < (cons 6 (cons 4 '())) 5)
;   ==
;   (extract < (cons 4 '()) 5)
;
; using DrRacket’s stepper.


; Exercise 247:
; Evaluate (extract < (cons 8 (cons 4 '())) 5) with DrRacket’s stepper.


; Exercise 248:
; Evaluate (squared>? 3 10) and (squared>? 4 10) in DrRacket’s stepper.


; Exercise 249:
; Functions are values: arguments, results, items in lists. Place the following
; definitions and expressions into DrRacket’s definitions window and use the
; stepper to find out how running this program works:
;
;   (define (f x) x)
;   (cons f '())
;   (f f)
;   (cons f (cons 10 (cons (f 10) '())))
;
; Note The stepper displays functions as so-called lambda expressions. Nameless
; Functions explains them in detail.


; Exercise 250:
; Design tabulate, which is the abstraction of the two functions in figure 92.
; When tabulate is properly designed, use it to define a tabulation function
; for sqr and tan.


; Exercise 251:
; Design fold1, which is the abstraction of the two functions in figure 93.


; Exercise 252:
; Design fold2, which is the abstraction of the two functions in figure 94.
; Compare this exercise with exercise 251. Even though both involve the product
; function, this exercise poses an additional challenge because the second
; function, image*, consumes a list of Posns and produces an Image. Still, the
; solution is within reach of the material in this section, and it is
; especially worth comparing the solution with the one to the preceding
; exercise. The comparison yields interesting insights into abstract
; signatures.


; Exercise 253:
; Each of these signatures describes a class of functions:
;
;   ; [Number -> Boolean]
;   ; [Boolean String -> Boolean]
;   ; [Number Number Number -> Number]
;   ; [Number -> [List-of Number]]
;   ; [[List-of Number] -> Boolean]
;
; Describe these collections with at least one example from ISL.


; Exercise 254:
; Formulate signatures for the following functions:
;
;   sort-n, which consumes a list of numbers and a function that consumes two
;   numbers (from the list) and produces a Boolean; sort-n produces a sorted
;   list of numbers.
;
;   sort-s, which consumes a list of strings and a function that consumes two
;   strings (from the list) and produces a Boolean; sort-s produces a sorted
;   list of strings.
;
; Then abstract over the two signatures, following the above steps. Also show
; that the generalized signature can be instantiated to describe the signature
; of a sort function for lists of IRs.


; Exercise 255:
; Formulate signatures for the following functions:
;
;   map-n, which consumes a list of numbers and a function from numbers to
;   numbers to produce a list of numbers.
;
;   map-s, which consumes a list of strings and a function from strings to
;   strings and produces a list of strings.
;
; Then abstract over the two signatures, following the above steps. Also show
; that the generalized signature can be instantiated to describe the signature
; of the map1 function above.


; Exercise 256:
; Explain the following abstract function:
;
;   ; [X] [X -> Number] [NEList-of X] -> X 
;   ; finds the (first) item in lx that maximizes f
;   ; if (argmax f (list x-1 ... x-n)) == x-i, 
;   ; then (>= (f x-i) (f x-1)), (>= (f x-i) (f x-2)), ...
;   (define (argmax f lx) ...)
;
; Use it on concrete examples in ISL. Can you articulate an analogous purpose
; statement for argmin?


; Exercise 257:
; You can design build-list and foldl with the design recipes that you know,
; but they are not going to be like the ones that ISL provides. For example,
; the design of your own foldl function requires a use of the list reverse
; function:
;
;   ; [X Y] [X Y -> Y] Y [List-of X] -> Y
;   ; f*oldl works just like foldl
;   (check-expect (f*oldl cons '() '(a b c))
;                 (foldl cons '() '(a b c)))
;   (check-expect (f*oldl / 1 '(6 3 2))
;                 (foldl / 1 '(6 3 2)))
;   (define (f*oldl f e l)
;     (foldr f e (reverse l)))
;
; Design build-l*st, which works just like build-list. Hint Recall the
; add-at-end function from exercise 193. Note on Design Accumulators covers the
; concepts needed to design these functions from scratch.


; Exercise 258:
; Use a local expression to organize the functions for drawing a polygon in
; figure 73. If a globally defined function is widely useful, do not make it
; local.


; Exercise 259:
; Use a local expression to organize the functions for rearranging words from
; Word Games, the Heart of the Problem.


; Exercise 260:
; Confirm the insight about the performance of inf.v2 by repeating the
; performance experiment of exercise 238.


; Exercise 261:
; Consider the function definition in figure 101. Both clauses in the nested
; cond expression extract the first item from an-inv and both compute (extract1
; (rest an-inv)). Use local to name this expression. Does this help increase
; the speed at which the function computes its result? Significantly? A little
; bit? Not at all?


; Exercise 262:
; Design the function identityM, which creates diagonal squares of 0s and 1s:
;
;   > (identityM 1)
;
;   (list (list 1))
;   > (identityM 3)
;
;   (list (list 1 0 0) (list 0 1 0) (list 0 0 1))
;
; Use the structural design recipe and exploit the power of local.


; Exercise 263:
; Use DrRacket’s stepper to study the steps of this calculation in detail.


; Exercise 264:
; Use DrRacket’s stepper to calculate out how it evaluates
;
;   (sup (list 2 1 3))
;
; where sup is the function from figure 89 equipped with local.


; Exercise 265:
; Use DrRacket’s stepper to fill in any gaps above.


; Exercise 266:
; Use DrRacket’s stepper to find out how ISL evaluates
;
;   ((local ((define (f x) (+ x 3))
;            (define (g x) (* x 4)))
;      (if (odd? (f (g 1)))
;          f
;          g))
;    2)
;
; to 5.


; Exercise 267:
; Use map to define the function convert-euro, which converts a list of US$
; amounts into a list of € amounts based on an exchange rate of US$1.06 per €
; (on April 13, 2017).
;
; Also use map to define convertFC, which converts a list of Fahrenheit
; measurements to a list of Celsius measurements.
;
; Finally, try your hand at translate, a function that translates a list of
; Posns into a list of lists of pairs of numbers.


; Exercise 268:
; An inventory record specifies the name of an item, a description, the
; acquisition price, and the recommended sales price.
;
; Define a function that sorts a list of inventory records by the difference
; between the two prices.


; Exercise 269:
; Define eliminate-expensive. The function consumes a number, ua, and a list of
; inventory records, and it produces a list of all those structures whose sales
; price is below ua.
;
; Then use filter to define recall, which consumes the name of an inventory
; item, called ty, and a list of inventory records and which produces a list of
; inventory records that do not use the name ty.
;
; In addition, define selection, which consumes two lists of names and selects
; all those from the second one that are also on the first.


; Exercise 270:
; Use build-list to define a function that
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
; Finally, define tabulate from exercise 250 using build-list.


; Exercise 271:
; Use ormap to define find-name. The function consumes a name and a list of
; names. It determines whether any of the names on the latter are equal to or
; an extension of the former.
;
; With andmap you can define a function that checks all names on a list of
; names that start with the letter "a".
;
; Should you use ormap or andmap to define a function that ensures that no name
; on some list exceeds a given width?


; Exercise 272:
; Recall that the append function in ISL concatenates the items of two lists
; or, equivalently, replaces '() at the end of the first list with the second
; list:
;
;   (equal? (append (list 1 2 3) (list 4 5 6 7 8))
;           (list 1 2 3 4 5 6 7 8))
;
; Use foldr to define append-from-fold. What happens if you replace foldr with
; foldl?
;
; Now use one of the fold functions to define functions that compute the sum
; and the product, respectively, of a list of numbers.
;
; With one of the fold functions, you can define a function that horizontally
; composes a list of Images. Hints (1) Look up beside and empty-image. Can you
; use the other fold function? Also define a function that stacks a list of
; images vertically. (2) Check for above in the libraries.


; Exercise 273:
; The fold functions are so powerful that you can define almost any list
; processing functions with them. Use fold to define map.


; Exercise 274:
; Use existing abstractions to define the prefixes and suffixes functions from
; exercise 190. Ensure that they pass the same tests as the original function.


; Exercise 275:
; Real-World Data: Dictionaries deals withYou may wish to tackle these
; exercises again after studying Nameless Functions. relatively simple tasks
; relating to English dictionaries. The design of two of them just call out for
; the use of existing abstractions:
;
;   Design most-frequent. The function consumes a Dictionary and produces the
;   Letter-Count for the letter that is most frequently used as the first one in
;   the words of the given Dictionary.
;
;   Design words-by-first-letter. The function consumes a Dictionary and
;   produces a list of Dictionarys, one per Letter. Do not include '() if there
;   are no words for some letter; ignore the empty grouping instead.
;
; For the data definitions, see figure 74.;


; Exercise 276:
; Real-World Data: iTunes explains how to analyze the information in an iTunes
; XML library.
;
;   Design select-album-date. The function consumes the title of an album, a
;   date, and an LTracks. It extracts from the latter the list of tracks from
;   the given album that have been played after the date.
;
;   Design select-albums. The function consumes an LTracks. It produces a list
;   of LTracks, one per album. Each album is uniquely identified by its title
;   and shows up in the result only once.
;
; See figure 77 for the services provided by the 2htdp/itunes library.


; Exercise 277:
; Full Space War spells out a game of space war. In the basic version, a UFO
; descends and a player defends with a tank. One additional suggestion is to
; equip the UFO with charges that it can drop at the tank; the tank is
; destroyed if a charge comes close enough.
;
; Inspect the code of your project for places where it can benefit from
; existing abstraction, that is, processing lists of shots or charges.
;
; Once you have simplified the code with the use of existing abstractions, look
; for opportunities to create abstractions. Consider moving lists of objects as
; one example where abstraction may pay off.


; Exercise 278:
; Feeding Worms explains how another one of the oldest computer games work. The
; game features a worm that moves at a constant speed in a player-controlled
; direction. When it encounters food, it eats the food and grows. When it runs
; into the wall or into itself, the game is over.
;
; This project can also benefit from the abstract list-processing in ISL. Look
; for places to use them and replace existing code one piece at a time, relying
; on the tests to ensure that you aren’t introducing mistakes.


; Exercise 279:
; Decide which of the following phrases are legal lambda expressions:
;
;   (lambda (x y) (x y y))
;
;   (lambda () 10)
;
;   (lambda (x) x)
;
;   (lambda (x y) x)
;
;   (lambda x 10)
;
; Explain why they are legal or illegal. If in doubt, experiment in the
; interactions area of DrRacket.


; Exercise 280:
; Calculate the result of the following expressions:
;
;       ((lambda (x y) (+ x (* x y)))
;        1 2)
;
;       ((lambda (x y)
;          (+ x
;             (local ((define z (* y y)))
;               (+ (* 3 z) (/ 1 x)))))
;        1 2)
;
;       ((lambda (x y)
;          (+ x
;             ((lambda (z)
;                (+ (* 3 z) (/ 1 z)))
;              (* y y))))
;        1 2)
;
; Check your results in DrRacket.


; Exercise 281:
; Write down a lambda expression that
;
;   consumes a number and decides whether it is less than 10;
;
;   multiplies two given numbers and turns the result into a string;
;
;   consumes a natural number and returns 0 for evens and 1 for odds;
;
;   consumes two inventory records and compares them by price; and
;
;   adds a red dot at a given Posn to a given Image.
;
; Demonstrate how to use these functions in the interactions area.


; Exercise 282:
; Experiment with the above definitions in DrRacket.
;
; Also add
;
;   ; Number -> Boolean
;   (define (compare x)
;     (= (f-plain x) (f-lambda x)))
;
; to the definitions area after renaming the left-hand f to f-plain and the
; right-hand one to f-lambda. Then run
;
;   (compare (random 100000))
;
; a few times to make sure the two functions agree on all kinds of inputs.


; Exercise 283:
; Confirm that DrRacket’s stepper can deal with lambda. Use it to step through
; the third example and also to determine how DrRacket evaluates the following
; expressions:
;
;   (map (lambda (x) (* 10 x))
;        '(1 2 3))
;     
;   (foldl (lambda (name rst)
;            (string-append name ", " rst))
;          "etc."
;          '("Matthew" "Robby"))
;     
;   (filter (lambda (ir) (<= (ir-price ir) th))
;           (list (make-ir "bear" 10)
;                 (make-ir "doll" 33)))


; Exercise 284:
; Step through the evaluation of this expression:
;
;   ((lambda (x) x) (lambda (x) x))
;
; Now step through this one:
;
;   ((lambda (x) (x x)) (lambda (x) x))
;
; Stop! What do you think we should try next?
;
; Yes, try to evaluate
;
;   ((lambda (x) (x x)) (lambda (x) (x x)))
;
; Be ready to hit STOP.


; Exercise 285:
;  Use map to define the function convert-euro, which converts a list of US$
; amounts into a list of € amounts based on an exchange rate of US$1.06 per €.
;
; Also use map to define convertFC, which converts a list of Fahrenheit
; measurements to a list of Celsius measurements.
;
; Finally, try your hand at translate, a function that translates a list of
; Posns into a list of lists of pairs of numbers.


; Exercise 286:
; An inventory record specifies the name of an inventory item, a description,
; the acquisition price, and the recommended sales price.
;
; Define a function that sorts a list of inventory records by the difference
; between the two prices.


; Exercise 287:
; Use filter to define eliminate-exp. The function consumes a number, ua, and a
; list of inventory records (containing name and price), and it produces a list
; of all those structures whose acquisition price is below ua.
;
; Then use filter to define recall, which consumes the name of an inventory
; item, called ty, and a list of inventory records and which produces a list of
; inventory records that do not use the name ty.
;
; In addition, define selection, which consumes two lists of names and selects
; all those from the second one that are also on the first.


; Exercise 288:
; Use build-list and lambda to define a function that
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
; Also define tabulate with lambda.


; Exercise 289:
; Use ormap to define find-name. The function consumes a name and a list of
; names. It determines whether any of the names on the latter are equal to or
; an extension of the former.
;
; With andmap you can define a function that checks all names on a list of
; names that start with the letter "a".
;
; Should you use ormap or andmap to define a function that ensures that no name
; on some list exceeds some given width?


; Exercise 290:
; Recall that the append function in ISL concatenates the items of two lists
; or, equivalently, replaces '() at the end of the first list with the second
; list:
;
;   (equal? (append (list 1 2 3) (list 4 5 6 7 8))
;           (list 1 2 3 4 5 6 7 8))
;
; Use foldr to define append-from-fold. What happens if you replace foldr with
; foldl?
;
; Now use one of the fold functions to define functions that compute the sum
; and the product, respectively, of a list of numbers.
;
; With one of the fold functions, you can define a function that horizontally
; composes a list of Images. Hints (1) Look up beside and empty-image. Can you
; use the other fold function? Also define a function that stacks a list of
; images vertically. (2) Check for above in the libraries.


; Exercise 291:
; The fold functions are so powerful that you can define almost any
; list-processing functions with them. Use fold to define map-via-fold, which
; simulates map.


; Exercise 292:
; Design the function sorted?, which comes with the following signature and
; purpose statement:
;
;   ; [X X -> Boolean] [NEList-of X] -> Boolean 
;   ; determines whether l is sorted according to cmp
;     
;   (check-expect (sorted? < '(1 2 3)) #true)
;   (check-expect (sorted? < '(2 1 3)) #false)
;     
;   (define (sorted? cmp l)
;     #false)
;
; The wish list even includes examples.


; Exercise 293:
; Develop found?, a specification for the find function:
;
;   ; X [List-of X] -> [Maybe [List-of X]]
;   ; returns the first sublist of l that starts
;   ; with x, #false otherwise
;   (define (find x l)
;     (cond
;       [(empty? l) #false]
;       [else
;        (if (equal? (first l) x) l (find x (rest l)))]))
;
; Use found? to formulate a check-satisfied test for find.


; Exercise 294:
; Develop is-index?, a specification for index:
;
;   ; X [List-of X] -> [Maybe N]
;   ; determine the index of the first occurrence
;   ; of x in l, #false otherwise
;   (define (index x l)
;     (cond
;       [(empty? l) #false]
;       [else (if (equal? (first l) x)
;                 0
;                 (local ((define i (index x (rest l))))
;                   (if (boolean? i) i (+ i 1))))]))
;
; Use is-index? to formulate a check-satisfied test for index.


; Exercise 295:
; Develop n-inside-playground?, a specification of the random-posns function
; below. The function generates a predicate that ensures that the length of the
; given list is some given count and that all Posns in this list are within a
; WIDTH by HEIGHT rectangle:
;
;   ; distances in terms of pixels 
;   (define WIDTH 300)
;   (define HEIGHT 300)
;     
;   ; N -> [List-of Posn]
;   ; generates n random Posns in [0,WIDTH) by [0,HEIGHT)
;   (check-satisfied (random-posns 3)
;                    (n-inside-playground? 3))
;   (define (random-posns n)
;     (build-list
;       n
;       (lambda (i)
;         (make-posn (random WIDTH) (random HEIGHT)))))
;
; Define random-posns/bad that satisfies n-inside-playground? and does not live
; up to the expectations implied by the above purpose statement. Note This
; specification is incomplete. Although the word “partial” might come to mind,
; computer scientists reserve the phrase “partial specification” for a
; different purpose. 


; Exercise 296:
; Use compass-and-pencil drawings to check the tests.


; Exercise 297:
; 297. Design the function distance-between. It consumes two numbers and a
; Posn: x, y, and p. The function computes the distance between the points
; (x, y) and p.
;
; Domain Knowledge The distance between image and image is
;
;   image
;
; that is, the distance of image to the origin.


; Exercise 298:
; Design my-animate. Recall that the animate function consumes the
; representation of a stream of images, one per natural number. Since streams
; are infinitely long, ordinary compound data cannot represent them. Instead,
; we use functions:
;
;   ; An ImageStream is a function: 
;   ;   [N -> Image]
;   ; interpretation a stream s denotes a series of images
;
; Here is a data example:
;
;   ; ImageStream
;   (define (create-rocket-scene height)
;     (place-image  50 height (empty-scene 60 60)))
;
; You may recognize this as one of the first pieces of code in the Prologue.
;
; The job of (my-animate s n) is to show the images (s 0), (s 1), and so on at
; a rate of 30 images per second up to n images total. Its result is the number
; of clock ticks passed since launched.
;
; Note This case is an example where it is possible to write down examples/test
; cases easily, but these examples/tests per se do not inform the design
; process of this big-bang function. Using functions as data representations
; calls for more design concepts than this book supplies.


; Exercise 299: 
; Design a data representation for finite and infinite sets so that you can
; represent the sets of all odd numbers, all even numbers, all numbers
; divisible by 10, and so on.
;
; Design the functions add-element, which adds an element to a set; union,
; which combines the elements of two sets; and intersect, which collects all
; elements common to two sets.
;
; Hint Mathematicians deal with sets as functions that consume a potential
; element ed and produce #true only if ed belongs to the set.

