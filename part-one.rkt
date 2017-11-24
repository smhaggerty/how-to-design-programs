; Exercise 1:
; Add the following definitions for x and y to DrRacket's definitions area:
;   (define x 3)
;   (define y 4)
; Now imagine that x and y are coordinates of a Cartesian point. Write down an
; expression that computes the distance of this point to the origin, that is, a
; point with the coordinates (0,0).
  (define (distance-to-origin x y)
    (sqrt (+ (expt x 2) (expt y 2))))


; Exercise 2:
; Add the following two lines to DrRacket's definitions area:
;   (define prefix "hello")
;   (define suffix "world")
; Then use string primitives to create an expression that concatenates prefix
; and suffix and adds "_" between them When you run this program, you will see
; "hello_world" in the interactions area
(define prefix "hello")
(define suffix "world")
(string-append prefix "_" suffix)


; Exercise 3:
; Add the following definitions for x and y to the
; definitions area:
;   (define str "helloworld")
;   (define i 5)
; Then create an expression using string primitives that adds "_" at position
; i. In general this means the resulting string is longer than the original
; one; here is the expected result is "hello_world"
(define str "helloworld")
(define i 5)
(string-append (substring str 0 i) "_"(substring str i))


; Exercise 4:
; Use the same setup as in exercise 3 to create an expression that deletes the
; ith position from str. Clearly this expression create a shorter string than
; the given one. Which values for i are legitimate?
(define str2 "helloworld")
(define j 5)
(string-append (substring str2 0 j) (substring str2 (+ j 1)))

  ; all positive Integer values less than the length of str are legitimate

; Exercise 5:
; Use the 2htdp/image library to create the image of a simple boat or tree.
; Make sure you can easily change the scale of the entire image
(require 2htdp/image)
(define size 50)
(define (draw-tree size)
  (overlay/xy
    (circle size "solid" "green")
    (- size (/ (/ size 5) 2))
    (* size 2)
    (rectangle (/ size 5) (* size 2) "solid" "brown")))


; Exercise 6:
; Add the following line to the definitions area:
;   (define cat "paste-image-here")
; Create and expression that counts the number of pixels in the image
(define cat .)
(define (count-pixels image)
  (* (image-width image) (image-height image)))


; Exercise 7:
; Suppose you want to decide whether today is an appropriate day to go to the
; mall. You go to the mall either if it is not sunny or if today is Friday
; (because that is when stores post new sales items). Here is how you could go
; about it using your new knowledge about Booleans. First, add these two
; lines to the definitions area of DrRacket:
;   (define sunny #true)
;   (define friday #false)
; Now create an expression that computes whether or not sunny is false or
; friday is true. So in this particular case, the answer is #false. (Why?)
(define sunny #true)
(define friday #false)
(or (not (and sunny #true)) (and friday #true))

  ; The answer is false because if neither of the arguments to "or" are #true,
  ; then "or" is false. It is not true that sunny is #false or friday is #true
  ; so the expression evaluates to #true


; Exercise 8:
; Add the following line to the definitions area:
;   (define cat "paste-image-here")
; Create a conditional expression that computes whether the image is tall or
; wide. An image should be labeled "tall" if its height is larger than or equal
; to its width; otherwise it is "wide". See exercise 1 for how to create such
; expressions in DrRacket; as you experiment, replace the cat with a rectangle
; of your choice to ensure that you know the expected answer. Now try the
; following modification. Create an expression that computes whether a picture
; is "tall", "wide", or "square".
(define cat2 .)
(if (> (image-width cat2) (image-height cat2))
    "wide"
    (if (= (image-width cat2) (image-height cat2))
        "square"
        "tall"))


; Exercise 9:
; Add the following line to the definitions area of
; DrRacket:
;   (define in ...)
; Then create and expression that converts the value of in to a positive
; number. For a String, it determines how long the String is; for an Image, it
; uses the area; for a Number, it decrements the number by 1, unless it is
; already 0 or negative; for #true it uses 10 and for #false 20
(require 2htdp/image)
(define a "soo")
(define b 1)
(define c .)
(define (foo in) (if (number? in)
    (if (> in 0)
        (- in 1)
        (abs in))
        (if (string? in)
          (string-length in)
          (if (image? in)
          (* (image-width in) (image-height in))
            (if (and in #true)
            10
            20)))))


; Exercise 10:
; Now relax, eat, sleep, and then tackle the next chapter


; Exercise 11: 
;Define a function that consumes two numbers, x and y, and that computes the
; distance of point (x, y) to the origin
(define (f x y) (sqrt (+ (expt x 2) (expt y 2))))


; Exercise 12: Define the function cvolume, which accepts the length of a side
; of an equalateral cube and computes its volume. If you have time, consider
; defining csurface, too.
(define (cvolume side-length) 
        (expt side-length 3))

(define (csurface side-length)
        (* (expt side-length 2) 6))


; Exercise 13:
; Define the function string-first, which extracts the first
; 1String from a non-empty string
(define (string-first non-empty-string)
        (substring non-empty-string 0 1))        


; Exercise 14:
; Define the function string-last, which extracts the last
; 1String from a
; non-empty string.
(define (string-last string)
        (substring string (- (string-length string) 1)))


; Exercise 15:
; Define ==>. The function consumes two Boolean values, call them sunny and
; friday. Its answer is #true if sunny is false or friday is true. Note
; Logicians call this Boolean operation implication and they use the notation
; sunny => friday for this purpose
(define (==> sunny friday)
        (if (or (not sunny) friday)
            #true
            #false))


; Exercise 16:
; Define the function image-area, which counts the number of pixels in a given
; image. See exercise 6 for ideas
(define (image-area img)
        (+ (image-width img) (image-height img)))


; Exercise 17:
; Define the function image-classify, which consumes an image and conditionally
; produces "tall" if the image is taller than wide, "wide" if it is wider than
; tall, or "square" if its width and height are the same. See exercise 8 for
; ideas.
(define (image-classify img2)
        (if (> (image-width img2) (image-height img2))
            "wide"
            (if (= (image-width img2) (image-height img2))
                "square"
                "tall")))


; Exercise 18: Define the function string-join, which consumes two strings and
; appends them with "_" in between. See exercise 2 for ideas.
(define (string-join prefix suffix)
        (string-append prefix "_" suffix))


; Exercise 19: Define the function string-insert, which consumes a string plus
; a number i and inserts "_" at the ith position of str. Assume i is a number
; between 0 and the length of the given string (inclusive). See exercise 3 for
; ideas. Ponder how string-insert copes with "".
(define (string-insert str3 number)
        (string-append (substring str3 0 number) "_" (substring str3 number)))

  ; The function will return an error if an index greater than 0 is used with an
  ; empty string


; Exercise 20:
; Define the function string-delete, which consumes a string plus a number i
; and deletes the ith position from str. Assume i is a number between 0
; (inclusive) and the length of the given string (exclusive). See exercise 4
; for ideas. Can string-delete deal with empty strings?
(define (string-delete str4 number2)
        (if (equal? str4 "")
            ""
            (string-append
              (substring str4 0 number2) (substring str4 (+ number2 1)))))

  ; Yes, string-delete can check for empty strings and return an empty string if
  ; so


; Exercise 21:
; Use DrRacket's stepper to evaluate (ff (ff 1)) step-by-step. Also try 
; (+ (ff 1) (ff 1)). Does DrRacket's stepper reuse the results of computations?

  ; No, DrRacket's stepper will reevaluate (ff 1) for each application of ff
  ; inside the + operation expression  


; Exercise 22:
; Use DrRacket's stepper on this programs fragment:
;  (define (distance-to-origin x y)
;    (sqrt (+ (sqr x) (sqr y))))
; (distance-to-origin 3 4)
; Does the explanation match your intuition?

  ; Yes, DrRacket evaluates the most deeply nested sub-expressions from left to
  ; right then moving up in scope until the top-level expression is evaluated


; Exercise 23:
; The first 1String in "hello world" is "h". How does the following function
; compute this result?
;   (define (string-first s)
;     (substring s 0 1))
; Use the stepper to confirm your ideas

  ; DrRacket substitues "hello world" for s in the function's body, then
  ; evaluates the body, returning the 1String "h"


; Exercise 24:
; (define (==> x y)
;   (or (not x) y)
; Use the stepper to determine the value of (==> #true #false). 

  ; The fonditional is false in only in the case of #true #false, so it returns
  ; #false


; Exercise 25:
; Take a look at this attempt to solve exercise 17
;   (define (image-classify img)
;     (cond
;       [(>= (image-height img) (image-width img)) "tall"]
;       [(= (image-height img) (image-width img)) "square"]
;       [(<= (image-height img) (image-width img) "wide")]))
; Does stepping through an application suggest a fix?

  ; Because the comparisons use are ">=" and "<=" rather than ">" and "<", the
  ; "=" comparison condition should come first


; Exercise 26:
; What do you expect as the value of this program
; (define (string-insert s i)
;   (string-append (substring s 0 i)
;                  "-"
;                  (substring s i)))
; (string-insert "helloworld" 6)
; Confirm your expectation with DrRacket and its stepper

  ; The expression will insert "_" at index number 6 of the string
  ; "helloworld", yielding "hellow_orld" (the string is 0 indexed)


; Exercise 27:
; Our solution to the sample problem contains several constants in the middle
; of functions. As "One Programs, Many Definitions" already points out, it is
; best to give names to such constants so that future readers understant where
; these numbers come from. Collect all definitions in DrRacket's definitions
; area and change them so that all magic numbers are refactored into constant
; definitions.
(define (attendees ticket-price)
  (- BASE_ATTENDANCE (* (- ticket-price BASE_TICKET_PRICE)
                        TICKET_PRICE_CHANGE_ATTENDANCE_IMPACT)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_PERFORMANCE_COST (* VARIABLE_PERFORMANCE_COST_RATE
                               (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define FIXED_PERFORMANCE_COST 180)
(define VARIABLE_PERFORMANCE_COST_RATE 0.04)
(define BASE_TICKET_PRICE 5)
(define BASE_ATTENDANCE 120)
(define TICKET_PRICE_CHANGE_ATTENDANCE_IMPACT (/ 15 0.1))


; Exercise 28:
; Determine the potential profit for these ticket prices: $1, $2, $3, $4, and
; $5. Which price maximizes the profit of the movie theater? Determine the best
; ticket price to a dime.
; 
; Here is an alternate version of the same program, given as a single function
; definition
; (define (profit price)
;   (- (* (+ 120
;            (* (/ 15 0.1)
;               (- 5.0 price)))
;         price)
;      (+ 180
;         (* 0.04
;            (+ 120
;               (* (/ 15 0.1)
;                  (- 5.0 price)))))))
; Enter this definition into DrRacket and ensure that it produces the same
; results as the original version for $1, $2, $3, $4, and $5.
(profit 1) --> 511.2
(profit 2) --> 937.2
(profit 3) --> 1063.2
(profit 4) --> 889.2
(profit 5) --> 415.2

  ; A price of $3 yields the most profit out of whole dollar prices $1-$5.
  ; The most profitable ticket price (to a dime) is $2.90, which yields $1064.1


; Exercise 29:
; After studying the costs of a show, the owner discovered several ways of
; lowering the cost. As a result of these improvements, there is no longer a
; fixed cost; a variable cost of $1.50 per attendee remains. Modify both
; programs to reflect this change. When the programs are modified, test them
; again with ticket prices of $3, $4, and $5 and compare the results.
(define (attendees ticket-price)
  (- BASE_ATTENDANCE (* (- ticket-price BASE_TICKET_PRICE)
                        TICKET_PRICE_CHANGE_ATTENDANCE_IMPACT)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_PERFORMANCE_COST (* VARIABLE_PERFORMANCE_COST_RATE
                               (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define FIXED_PERFORMANCE_COST 0)
(define VARIABLE_PERFORMANCE_COST_RATE 1.5)
(define BASE_TICKET_PRICE 5)
(define BASE_ATTENDANCE 120)
(define TICKET_PRICE_CHANGE_ATTENDANCE_IMPACT (/ 15 0.1))

(define (_profit price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(profit 1)   -->  -360
(_profit 1)  -->  -360
(profit 2)   -->   285
(_profit 2)  -->   285
(profit 3)   -->   630
(_profit 3)  -->   630
(profit 4)   -->   675
(_profit 4)  -->   675
(profit 5)   -->   420
(_profit 5)  -->   420


; Exercise 30:
; Define constants for the price optimization program at the movie theater so
; that the price sensitivity of attendance (15 people for every 10 cents)
; becomes a computed constant.
(define (attendees ticket-price)
  (- BASE_ATTENDANCE (* (- ticket-price BASE_TICKET_PRICE)
                        PRICE_SENSITIVITY_OF_ATTENDANCE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_PERFORMANCE_COST (* VARIABLE_PERFORMANCE_COST_RATE
                               (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define FIXED_PERFORMANCE_COST 180)
(define VARIABLE_PERFORMANCE_COST_RATE 0.04)
(define BASE_TICKET_PRICE 5)
(define BASE_ATTENDANCE 120)
(define ATTENDANCE_DELTA 15)
(define PRICE_DELTA 0.1)
(define PRICE_SENSITIVITY_OF_ATTENDANCE (/ ATTENDANCE_DELTA PRICE_DELTA))


; Exercise 31:
; Recall the letter program from Composing Functions. Here is how to launch the
; program and have it write its output to the interactions area:
; > (write-file
;     'stdout
;     (letter "Matthew" "Fisler" "Felleisen"))
; Dear Matthew,
; 
; We have discovered that all people with the
; last name Fisler have won our lottery. So, 
; Matthew, hurry and pick up your prize.
;
; Sincerely, 
; Felleisen
; 'stdout
;
; Of course, programs are useful because you can launch them for many different
; inputs. Run letter on three inputs of your choice.



; Exercise 32:
; Most people no longer use desktop computers just to run applications but also
; employ cell phones, tablets, and their cars’ information control screen. Soon
; people will use wearable computers in the form of intelligent glasses,
; clothes, and sports gear. In the somewhat more distant future, people may
; come with built-in bio computers that directly interact with body functions.
; Think of ten different forms of events that software applications on such
; computers will have to deal with.



; Exercise 33:
; Research the “year 2000” problem and what it meant for software developers.



; Exercise 34:
; Design the function string-first, which extracts the first character from a
; non-empty string. Don’t worry about empty strings.



; Exercise 35: Design the function string-last, which extracts the last
; character from a non-empty string.



; Exercise 36: Design the function image-area, which counts the number of
; pixels in a given image.



; Exercise 37: Design the function string-rest, which produces a string like
; the given one with the first character removed.



; Exercise 38: Design the function string-remove-last, which produces a string
; like the given one with the last character removed.



; Exercise 39:
; We started the development of our car image with a
; single plain definition:
    (define WHEEL-RADIUS 5)
; The definition of WHEEL-DISTANCE is based on the wheel’s radius. Hence,
; changing WHEEL-RADIUS from 5 to 10 doubles the size of the car image. This
; kind of program  organization is dubbed single point of control, and good
; design employs this idea as much as possible. Develop your favorite image of
; an automobile so that  WHEEL-RADIUS remains the single point of control.



; Exercise 40: Formulate the examples as BSL tests, that is, using the
; check-expect form. Introduce a mistake. Re-run the tests.



; Exercise 41:
; Finish the sample problem and get the program to run. That is, assuming that
; you have solved exercise 39, define the constants BACKGROUND and Y-CAR. Then
; assemble all the function definitions, including their tests. When your
; program runs to your satisfaction, add a tree to the scenery. We used:
;   (define tree
;     (underlay/xy (circle 10 "solid" "green")
;                  9 15
;                  (rectangle 2 20 "solid" "brown")))
; to create a tree-like shape. Also add a clause to the big-bang expression
; that stops the animation when the car has disappeared on the right side.



; Exercise 42:
; Modify the interpretation of the sample data definition so that a state
; denotes the x-coordinate of the right-most edge of the car. 



; Exercise 43:
; Design the functions tock and render. Then develop a big-bang expression so
; that once again you get an animation of a car traveling from left to right
; across the world’s canvas.
;
; How do you think this program relates to animate from Prologue: How to Program?
;
; Use the data definition to design a program that moves the car according to a
; sine wave. (Don’t try to drive like that.)



; Exercise 44:
; Formulate the examples as BSL tests. Click RUN and watch them fail.



; Exercise 45:
; Design a “virtual cat” world program that continuously moves the cat from
; left to right. Let’s call it cat-prog and let’s assume it consumes the
; starting position of the cat. Furthermore, make the cat move three pixels per
; clock tick. Whenever the cat disappears on the right, it reappears on the
; left. You may wish to read up on the modulo function.



; Exercise 46:
; Improve the cat animation with a slightly different image:
;   (define cat2 'insert-image-here')
; Adjust the rendering function from exercise 45 so that it uses one cat image
; or the other based on whether the x-coordinate is odd. Read up on odd? in the
; HelpDesk, and use a cond expression to select cat images.



; Exercise 47:
; Design a world program that maintains and displays a “happiness gauge.” Let’s
; call it gauge-prog, and let’s agree that the program consumes the maximum
; level of happiness. The gauge display starts with the maximum score, and with
; each clock tick, happiness decreases by -0.1; it never falls below 0, the
; minimum happiness score. Every time the down arrow key is pressed, happiness
; increases by 1/5; every time the up arrow is pressed, happiness jumps by 1/3.
;
; To show the level of happiness, we use a scene with a solid, red rectangle
; with a black frame. For a happiness level of 0, the red bar should be gone;
; for the maximum happiness level of 100, the bar should go all the way across
; the scene.



; Exercise 48:
; Enter the definition of reward followed by (reward 18) into the definitions
; area of DrRacket and use the stepper to find out how DrRacket evaluates
; applications of the function.



; Exercise 49:
; A cond expression is really just an expression and may therefore show up in
; the middle of another expression:
;
;   (- 200 (cond [(> y 200) 0] [else y]))
;
; Use the stepper to evaluate the expression for y as 100 and 210.
;
; Reformulate create-rocket-scene.v5 to use a nested expression; the resulting
; function mentions place-image only once.



; Exercise 50:
; If you copy and paste the above function definition into the definitions area
; of DrRacket and click RUN, DrRacket highlights two of the three cond lines.
; This coloring tells you that your test cases do not cover the full
; conditional. Add enough tests to make DrRacket happy.



; Exercise 51:
; Design a big-bang program that simulates a traffic light for a given
; duration. The program renders the state of a traffic light as a solid circle
; of the appropriate color, and it changes state on every clock tick. What is
; the most appropriate initial state? Ask your engineering friends.



; Exercise 52:
; Which integers are contained in the four intervals above?



; Exercise 53:
; The design recipe for world programs demands that you translate information
; into data and vice versa to ensure a complete understanding of the data
; definition. It’s best to draw some world scenarios and to represent them with
; data and, conversely, to pick some data examples and to draw pictures that
; match them. Do so for the LR definition, including at least HEIGHT and 0 as
; examples.



; Exercise 54:
; Why is (string=? "resting" x) incorrect as the first condition in show?
; Conversely, formulate a completely accurate condition, that is, a Boolean
; expression that evaluates to #true precisely when x belongs to the first
; sub-class of LRCD.



; Exercise 55:
; Take another look at show. It contains three instances of an expression with
; the approximate shape:
;
;   (place-image ROCKET 10 (- ... CENTER) BACKG)
;
; This expression appears three times in the function: twice to draw a resting
; rocket and once to draw a flying rocket. Define an auxiliary function that
; performs this work and thus shorten show. Why is this a good idea? You may
; wish to reread Prologue: How to Program.



; Exercise 56:
; Define main2 so that you can launch the rocket and watch it lift off. Read up
; on the on-tick clause to determine the length of one tick and how to change
; it.
;
; If you watch the entire launch, you will notice that once the rocket reaches
; the top something curious happens. Explain. Add a stop-when clause to main2
; so that the simulation of the liftoff stops gracefully when the rocket is out
; of sight.



; Exercise 57:
; Recall that the word “height” forced us to choose one of two possible
; interpretations. Now that you have solved the exercises in this section,
; solve them again using the first interpretation of the word. Compare and
; contrast the solutions.



; Exercise 58:
; Introduce constant definitions that separate the intervals for low prices and
; luxury prices from the others so that the legislators in Tax Land can easily
; raise the taxes even more.



; Exercise 59:
; Finish the design of a world program that simulates the traffic light FSA.
; Here is the main function:
;   ; TrafficLight -> TrafficLight
;   ; simulates a clock-based American traffic light
;   (define (traffic-light-simulation initial-state)
;     (big-bang initial-state
;       [to-draw tl-render]
;       [on-tick tl-next 1]))
;
; The function’s argument is the initial state for the big-bang expression, 
; which tells DrRacket to redraw the state of the world with tl-render and to
; handle clock ticks with tl-next. Also note that it informs the computer that
; the clock should tick once per second.
;
; Complete the design of tl-render and tl-next. Start with copying
; TrafficLight, tl-next, and tl-render into DrRacket’s definitions area.
;
; Here are some test cases for the design of the latter:
;
;   (check-expect (tl-render "red") "insert-image-here")
;   (check-expect (tl-render "yellow") "insert-image-here")
;
; Your function may use these images directly. If you decide to create images
; with the functions from the 2htdp/image library, design an auxiliary function
; for creating the image of a one-color bulb. Then read up on the place-image
; function, which can place bulbs into a background scene.



; Exercise 60:
; An alternative data representation for a traffic light program may use
; numbers instead of strings:
;
;   ; An N-TrafficLight is one of:
;   ; – 0 interpretation the traffic light shows red
;   ; – 1 interpretation the traffic light shows green
;   ; – 2 interpretation the traffic light shows yellow
;
; It greatly simplifies the definition of tl-next:
;
;   ; N-TrafficLight -> N-TrafficLight
;   ; yields the next state, given current state cs
;   (define (tl-next-numeric cs) (modulo (+ cs 1) 3))
;
; Reformulate tl-next’s tests for tl-next-numeric. Does the tl-next function
; convey its intention more clearly than the tl-next-numeric function? If so,
; why? If not, why not?



; Exercise 61:
; Figure 27 displays two different functions that switch the state of a traffic
; light in a simulation program. Which of the two is properly designed using
; the recipe for itemization? Which of the two continues to work if you change
; the constants to the following
;
;   (define RED "red")
;   (define GREEN "green")
;   (define YELLOW "yellow")
;
; Does this help you answer the questions?



; Exercise 62:
; ; DoorState -> DoorState
; ; simulates a door with an automatic door closer
; (define (door-simulation initial-state)
;   (big-bang initial-state
;     [on-tick door-closer]
;     [on-key door-action]
;     [to-draw door-render]))
;
; During a door simulation the “open” state is barely visible. Modify
; door-simulation so that the clock ticks once every three seconds. Rerun the
; simulation.



; Exercise 63:
; Evaluate the following expressions:
;
;   (distance-to-0 (make-posn 3 4))
;
;   (distance-to-0 (make-posn 6 (* 2 4)))
;
;   (+ (distance-to-0 (make-posn 12 5)) 10)
;
; by hand. Show all steps. Assume that sqr performs its computation in a single
; step. Check the results with DrRacket’s stepper.



; Exercise 64:
; Design the function manhattan-distance, which measures the Manhattan distance
; of the given posn to the origin.



;Exercise 65:
; Take a look at the following structure type definitions:
;
;   (define-struct movie [title producer year])
;
;   (define-struct person [name hair eyes phone])
;
;   (define-struct pet [name number])
;
;   (define-struct CD [artist title price])
;
;   (define-struct sweater [material size producer])
;
; Write down the names of the functions (constructors, selectors, and
; predicates) that each introduces.



; Exercise 66:
; Revisit the structure type definitions of exercise 65. Make sensible guesses
; as to what kind of values go with which fields. Then create at least one
; instance per structure type definition.



; Exercise 67:
; Here is another way to represent bouncing balls:
;
;   (define SPEED 3)
;   (define-struct balld [location direction])
;   (make-balld 10 "up")
;
; Interpret this code fragment and create other instances of balld.



; Exercise 68:
; An alternative to the nested data representation of balls uses four fields to
; keep track of the four properties:
;
;   (define-struct ballf [x y deltax deltay])
;
; Programmers call this a flat representation. Create an instance of ballf that
; has the same interpretation as ball1.



; Exercise 69:
; Draw box representations for the solution of exercise 65.



; Exercise 70:
; Spell out the laws for these structure type definitions:
;
;   (define-struct centry [name home office cell])
;   (define-struct phone [area number])
;
; Use DrRacket’s stepper to confirm 101 as the value of this expression:
;
;   (phone-area
;    (centry-office
;     (make-centry "Shriram Fisler"
;       (make-phone 207 "363-2421")
;       (make-phone 101 "776-1099")
;       (make-phone 208 "112-9981")))) ""



; Exercise 71:
; Place the following into DrRacket’s definitions area:
;
;   ; distances in terms of pixels:
;   (define HEIGHT 200)
;   (define MIDDLE (quotient HEIGHT 2))
;   (define WIDTH  400)
;   (define CENTER (quotient WIDTH 2))
;     
;   (define-struct game [left-player right-player ball])
;     
;   (define game0
;     (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))
;
; Click RUN and evaluate the following expressions:
;
;   (game-ball game0)
;   (posn? (game-ball game0))
;   (game-left-player game0)
;
; Explain the results with step-by-step computations. Double-check your
; computations with DrRacket’s stepper.



; Exercise 72:
; Formulate a data definition for the above phone structure type definition
; that accommodates the given examples.
;
; Next formulate a data definition for phone numbers using this structure type
; definition:
;
;   (define-struct phone# [area switch num])
;
; Historically, the first three digits make up the area code, the next three
; the code for the phone switch (exchange) of your neighborhood, and the last
; four the phone with respect to the neighborhood. Describe the content of the
; three fields as precisely as possible with intervals.



; Exercise 73:
; Design the function posn-up-x, which consumes a Posn p and a Number n. It
; produces a Posn like p with n in the x field.
;
; A neat observation is that we can define x+ using posn-up-x:
;
;   (define (x+ p)
;     (posn-up-x p (+ (posn-x p) 3)))
;
; Note Functions such as posn-up-x are often called updaters or functional
; setters. They are extremely useful when you write large programs.



; Exercise 74:
; Copy all relevant constant and function definitions to DrRacket’s definitions
; area. Add the tests and make sure they pass. Then run the program and use the
; mouse to place the red dot.



; Exercise 75:
; Enter these definitions and their test cases into the definitions area of
; DrRacket and make sure they work. This is the first time that you have dealt
; with a “wish,” and you need to make sure you understand how the two functions
; work together.



; Exercise 76:
; Formulate data definitions for the following structure type definitions:
;
;   (define-struct movie [title producer year])
;
;   (define-struct person [name hair eyes phone])
;
;   (define-struct pet [name number])
;
;   (define-struct CD [artist title price])
;
;   (define-struct sweater [material size producer])
;
; Make sensible assumptions as to what kind of values go into each field.



; Exercise 77:
; Provide a structure type definition and a data definition for representing
; points in time since midnight. A point in time consists of three numbers:
; hours, minutes, and seconds.



; Exercise 78:
; Provide a structure type and a data definition for representing three-
; words. A word consists of lowercase letters, represented with the 1Strings
; "a" through "z" plus #false. Note This exercise is a part of the design of a
; hangman game; see exercise 396.



; Exercise 79:
; Create examples for the following data definitions:
;
;       ; A Color is one of: 
;       ; — "white"
;       ; — "yellow"
;       ; — "orange"
;       ; — "green"
;       ; — "red"
;       ; — "blue"
;       ; — "black"
;
;   Note DrRacket recognizes many more strings as colors. End
;
;       ; H is a Number between 0 and 100.
;       ; interpretation represents a happiness value
;
;       (define-struct person [fstname lstname male?])
;       ; A Person is a structure:
;       ;   (make-person String String Boolean)
;
;   Is it a good idea to use a field name that looks like the name of a
;   predicate?
;
;       (define-struct dog [owner name age happiness])
;       ; A Dog is a structure:
;       ;   (make-dog Person String PositiveInteger H)
;
;   Add an interpretation to this data definition, too.
;
;       ; A Weapon is one of: 
;       ; — #false
;       ; — Posn
;       ; interpretation #false means the missile hasn't 
;       ; been fired yet; a Posn means it is in flight
;
; The last definition is an unusual itemization, combining built-in data with a
; structure type. The next chapter deals with such definitions in depth.


; Exercise 80:
; Create templates for functions that consume instances of the following
; structure types:
;
;   (define-struct movie [title director year])
;
;   (define-struct pet [name number])
;
;   (define-struct CD [artist title price])
;
;   (define-struct sweater [material size color])
;
; No, you do not need data definitions for this task.


; Exercise 81:
; Design the function time->seconds, which consumes instances of time
; structures (see exercise 77) and produces the number of seconds that have
; passed since midnight. For example, if you are representing 12 hours, 30
; minutes, and 2 seconds with one of these structures and if you then apply
; time->seconds to this instance, the correct result is 45002.


; Exercise 82:
; Design the function compare-word. The function consumes two three-letter
; words (see exercise 78). It produces a word that indicates where the given
; ones agree and disagree. The function retains the content of the structure
; fields if the two agree; otherwise it places #false in the field of the
; resulting word. Hint The exercises mentions two tasks: the comparison of
; words and the comparison of “letters.”


; Exercise 83:
; Design the function render, which consumes an Editor and produces an image.
; 
; The purpose of the function is to render the text within an empty scene of
; image pixels. For the cursor, use a image red rectangle and for the strings,
; black text of size 16.
;
; Develop the image for a sample string in DrRacket’s  interactions area. We
; started with this expression:
;
;   (overlay/align "left" "center"
;                  (text "hello world" 11 "black")
;                  (empty-scene 200 20))
;
; You may wish to read up on beside, above, and such  functions. When you are
; happy with the looks of the  image, use the expression as a test and as a
; guide to  the design of render.


; Exercise 84:
; Design edit. The function consumes two inputs, an editor ed and a KeyEvent
; ke, and it produces another editor. Its task is to add a single-character
; KeyEvent ke to the end of the pre field of ed, unless ke denotes the
; backspace ("\b") key. In that case, it deletes the character immediately to
; the left of the cursor (if there are any). The function ignores the tab key
; ("\t") and the return key ("\r").
;
; The function pays attention to only two KeyEvents longer than one letter:
; "left" and "right". The left arrow moves the cursor one character to the left
; (if any), and the right arrow moves it one character to the right (if any).
; All other such KeyEvents are ignored.
;
; Develop a goodly number of examples for edit, paying attention to special
; cases. When we solved this exercise, we created 20 examples and turned all
; of them into tests.
;
; Hint Think of this function as consuming KeyEvents, a collection that is
; specified as an enumeration. It uses auxiliary functions to deal with the
; Editor structure. Keep a wish list handy; you will need to design additional
; functions for most of these auxiliary functions, such as string-first,
; string-rest, string-last, and  string-remove-last. If you haven’t done so,
; solve the exercises in Functions.


; Exercise 85:
; Define the function run. Given the pre field of an editor, it launches an
; interactive editor, using render and edit from the preceding two exercises
; for the to-draw and on-key clauses, respectively.


; Exercise 86:
; Notice that if you type a lot, your editor program does not display all of
; the text. Instead the text is cut off at the right margin. Modify your
; function edit from exercise 84 so that it ignores a keystroke if adding it to
; the end of the pre field would mean the rendered text is too wide for your
; canvas.


; Exercise 87:
; Develop a data representation for an editor based on our first idea, using a
; string and an index. Then solve the preceding exercises again. Retrace the
; design recipe. Hint if you haven’t done so, solve the exercises in Functions.
;
; Note on Design Choices The exercise is a first study of making design
; choices. It shows that the very first design choice concerns the data
; representation. Making the right choice requires planning ahead and weighing
; the complexity of each. Of course, getting good at this is a question of
; gaining experience.


; Exercise 88:
; Define a structure type that keeps track of the cat’s x-coordinate and its
; happiness. Then formulate a data definition for cats, dubbed VCat, including
; an interpretation.


; Exercise 89:
; Design the happy-cat world program, which manages a walking cat and its
; happiness level. Let’s assume that the cat starts out with perfect happiness.
;
; Hints (1) Reuse the functions from the world programs in Virtual Pet Worlds.
; (2) Use structure type from the preceding exercise to represent the state of
; the world.


; Exercise 90:
; Modify the happy-cat program from the preceding exercises so that it stops
; whenever the cat’s happiness falls to 0.


; Exercise 91:
; Extend your structure type definition and data definition from exercise 88 to
; include a direction field. Adjust your happy-cat program so that the cat
; moves in the specified direction. The program should move the cat in the
; current direction, and it should turn the cat around when it reaches either
; end of the scene.


; Exercise 92:
; Design the cham program, which has the chameleon continuously walking across
; the canvas from left to right. When it reaches the right end of the canvas,
; it disappears and immediately reappears on the left. Like the cat, the
; chameleon gets hungry from all the walking, and, as time passes by, this
; hunger expresses itself as unhappiness.
;
; For managing the chameleon’s happiness gauge, you may reuse the happiness
; gauge from the virtual cat. To make the chameleon happy, you feed it (down
; arrow, two points only); petting isn’t allowed. Of course, like all
; chameleons, ours can change color, too: "r" turns it red, "b" blue, and "g"
; green. Add the chameleon world program to the virtual cat game and reuse
; functions from the latter when possible.
;
; Start with a data definition, VCham, for representing chameleons.


; Exercise 93:
; Copy your solution to exercise 92 and modify the copy so that the chameleon
; walks across a tricolor background. Our solution uses these colors:
;
;   (define BACKGROUND
;     (beside (empty-scene WIDTH HEIGHT "green")
;             (empty-scene WIDTH HEIGHT "white")
;             (empty-scene WIDTH HEIGHT "red")))
;
; but you may use any colors. Observe how the chameleon changes colors to blend
; in as it crosses the border between two colors.
;
; Note When you watch the animation carefully, you see the chameleon riding on
; a white rectangle. If you know how to use image editing software, modify the
; picture so that the white rectangle is invisible. Then the chameleon will
; really blend in.


; Exercise 94:
; Draw some sketches of what the game scenery looks like  at various stages.
; Use the sketches to determine the constant and the variable pieces of the
; game. For the former, develop physical and graphical constants that describe
; the dimensions of the world (canvas) and its objects. Also develop some
; background scenery. Finally, create your initial scene from the constants for
; the tank, the UFO, and the background.


; Exercise 95:
; Explain why the three instances are generated according to the first or
; second clause of the data definition.


; Exercise 96:
; Sketch how each of the three game states could be rendered assuming a 200x200
; image canvas.


; Exercise 97:
; Design the functions tank-render, ufo-render, and missile-render. Compare
; this expression:
;
;   (tank-render
;     (fired-tank s)
;     (ufo-render (fired-ufo s)
;                 (missile-render (fired-missile s)
;                                 BACKGROUND)))
;
; with this one:
;
;   (ufo-render
;     (fired-ufo s)
;     (tank-render (fired-tank s)
;                  (missile-render (fired-missile s)
;                                  BACKGROUND)))
;
; When do the two expressions produce the same result?


; Exercise 98:
; Design the function si-game-over? for use as the  stop-when handler. The game
; stops if the UFO lands or if the missile hits the UFO. For both conditions,
; we recommend that you check for proximity of one object to another.
;
; The stop-when clause allows for an optional second sub-expression, namely a
; function that renders the final state of the game. Design si-render-final and
; use it as the second part for your stop-when clause in the main function of
; exercise 100.


; Exercise 99:
; Design si-move. This function is called for every clock tick to determine to
; which position the objects move now. Accordingly, it consumes an element of
; SIGS and produces another one.
;
; Moving the tank and the missile (if any) is relatively straightforward. They
; move in straight lines at a constant speed. Moving the UFO calls for small
; random jumps to the left or the right. Since you have never dealt with
; functions that create random numbers, the rest of this exercise is a longish
; hint on how to deal with this issue.
;
; BSL comes with a function that creates random numbers. Introducing this
; function illustrates why the signatures and purpose statements play such an
; important role during the design. Here is the relevant material for the
; function you need:
;
;   ; Number -> Number
;   ; produces a number in the interval [0,n),
;   ; possibly a different one each time it is called 
;   (define (random n) ...)
;
; Since the signature and purpose statement precisely describe what a function
; computes, you can now experiment with random in DrRacket’s interactions area.
; Stop! Do so!
; 
; If random produces different numbers (almost) every time it is called,
; testing functions that use random is difficult. To start with, separate
; si-move and its proper functionality into two parts:
;
;   (define (si-move w)
;     (si-move-proper w (random ...)))
;    
;   ; SIGS Number -> SIGS 
;   ; moves the space-invader objects predictably by delta
;   (define (si-move-proper w delta)
;     w)
;
; With this definition you separate the creation of a random number from the
; act of moving the game objects. While random may produce different results
; every time it is called, si-move-proper can be tested on specific numeric
; inputs and is thus guaranteed to return the same result when given the same
; inputs. In short, most of the code remains testable.
;
; Instead of calling random directly, you may wish to design a function that
; creates a random x-coordinate for the UFO. Consider using check-random from
; BSL’s testing framework to test such a function.


; Exercise 100:
; Design the function si-control, which plays the role of the key-event
; handler. As such, it consumes a game state and a KeyEvent and produces a new
; game state. It reacts to three different keys:
;
;   pressing the left arrow ensures that the tank moves left;
;
;   pressing the right arrow ensures that the tank moves right; and
;
;   pressing the space bar fires the missile if it hasn’t been launched yet.
;
; Once you have this function, you can define the si-main  function, which uses
; big-bang to spawn the game-playing  window. Enjoy!


; Exercise 101:
; Turn the examples in figure 35 into test cases.


; Exercise 102:
; Design all other functions that are needed to complete the game for this
; second data definition.


; Exercise 103:
; Develop a data representation for the following four kinds of zoo animals:
;
;   spiders, whose relevant attributes are the number of remaining legs (we
;   assume that spiders can lose legs in accidents) and the space they need in
;   case of transport;
;
;   elephants, whose only attributes are the space they need in case of
;   transport;
;
;   boa constrictors, whose attributes include length and girth; and
;   armadillos, for which you must determine appropriate attributes, including
;   one that determines the space needed for transport.
;
; Develop a template for functions that consume zoo animals.
;
; Design the fits? function, which consumes a zoo animal and a description of a
; cage. It determines whether the cage’s volume is large enough for the animal.


; Exercise 104:
; Your home town manages a fleet of vehicles: automobiles, vans, buses, and
; SUVs. Develop a data representation for vehicles. The representation of each
; vehicle must describe the number of passengers that it can carry, its license
; plate number, and its fuel consumption (miles per gallon). Develop a template
; for functions that consume vehicles.


; Exercise 105:
; Some program contains the following data definition:
;
;   ; A Coordinate is one of: 
;   ; – a NegativeNumber 
;   ; interpretation on the y axis, distance from top
;   ; – a PositiveNumber 
;   ; interpretation on the x axis, distance from left
;   ; – a Posn
;   ; interpretation an ordinary Cartesian point
;
; Make up at least two data examples per clause in the data definition. For
; each of the examples, explain its meaning with a sketch of a canvas.


; Exercise 106:
; In More Virtual Pets we discussed the creation of virtual pets that come with
; happiness gauges. One of the virtual pets is a cat; the other one, a
; chameleon. Each program is dedicated to a single pet, however.
;
; Design the cat-cham world program. Given both a location and an animal, it
; walks the latter across the canvas, starting from the given location. Here is
; the chosen data representation for animals:
;
;   ; A VAnimal is either
;   ; – a VCat
;   ; – a VCham
;
; where VCat and VCham are your data definitions from exercises 88 and 92.
;
; Given that VAnimal is the collection of world states, you need to design
;
;   a rendering function from VAnimal to Image;
;
;   a function for handling clock ticks, from VAnimal to VAnimal; and
;
;   a function for dealing with key events so that you can feed and pet and
;   colorize your animal—as applicable.
;
; It remains impossible to change the color of a cat or to pet a chameleon.


; Exercise 107:
; Design the cham-and-cat program, which deals with both a virtual cat and a
; virtual chameleon. You need a data definition for a “zoo” containing both
; animals and functions for dealing with it.
;
; The problem statement leaves open how keys manipulate the two animals. Here
; are two possible interpretations:
;
;   Each key event goes to both animals.
;
;   Each key event applies to only one of the two animals.
;
; For this alternative, you need a data representation that specifies a focus
; animal, that is, the animal that can currently be manipulated. To switch
; focus, have the key-handling function interpret "k" for “kitty” and "l" for
; lizard. Once a player hits "k", the following keystrokes apply to the cat
; only—until the player hits "l".
;
; Choose one of the alternatives and design the appropriatevprogram.


; Exercise 108:
; In its default state, a pedestrian crossing light shows an orange person
; standing on a red background. When it is time to allow the pedestrian to
; cross the street, the light receives a signal and switches to a green,
; walking person. This phase lasts for 10 seconds. After that the light
; displays the digits 9, 8, ..., 0 with odd numbers colored orange and even
; numbers colored green. When the countdown reaches 0, the light switches back
; to its default state.
;
; Design a world program that implements such a pedestrian traffic light. The
; light switches from its default state when you press the space bar on your
; keyboard. All other transitions must be reactions to clock ticks.


; Exercise 109:
; Design a world program that recognizes a pattern in a sequence of KeyEvents.
; Initially the program shows a 100 by 100 white rectangle. Once your program
; has encountered the first desired letter, it displays a yellow rectangle of
; the same size. After encountering the final letter, the color of the
; rectangle turns green. If any “bad” key event occurs, the program displays a
; red rectangle.
;
; The specific sequences that your program looks for start with "a", followed
; by an arbitrarily long mix of "b" and "c", and ended by a "d". Clearly,
; "acbd" is one example of an acceptable string; two others are "ad" and
; "abcbbbcd". Of course, "da", "aa", or "d" do not match.

; Exercise 110:
; A checked version of area-of-disk can also enforce that the arguments to the
; function are positive numbers, not just arbitrary numbers. Modify
; checked-area-of-disk in this way.


; Exercise 111:
; Take a look at these definitions:
;
;   (define-struct vec [x y])
;   ; A vec is
;   ;   (make-vec PositiveNumber PositiveNumber)
;   ; interpretation represents a velocity vector
;
; Develop the function checked-make-vec, which is to be understood as a checked
; version of the primitive operation make-vec. It ensures that the arguments to
; make-vec are positive numbers. In other words, checked-make-vec enforces our
; informal data definition.


; Exercise 112:
; Reformulate the predicate now using an or expression. 


; Exercise 113:
; Design predicates for the following data definitions from the preceding
; section: SIGS, Coordinate (exercise 105), and VAnimal.


; Exercise 114:
; Use the predicates from exercise 113 to check the space invader world
; program, the virtual pet program (exercise 106), and the editor program (A
; Graphical Editor).


; Exercise 115:
; Revise light=? so that the error message specifies which of the two arguments
; isn’t an element of TrafficLight.

