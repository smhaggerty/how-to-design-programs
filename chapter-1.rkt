;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chapter-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 1:
; Add the following definitions for x and y to DrRacket's
; definitions area:
;   (define x 3)
;   (define y 4)
; Now imagine that x and y are coordinates of a Cartesian
; point. Write down an expression that computes the
; distance of this point to the origin, that is, a point
; with the coordinates (0,0).


; Exercise 2:
; Add the following two lines to DrRacket's
; definitions area:
;   (define prefix "hello")
;   (define suffix "world")
; Then use string primitives to create an expression that
; concatenates prefix and suffix and adds "_" between them
; When you run this program, you will see "hello_world" in
; the interactions area

; Exercise 3:
; Add the following definitions for x and y to the
; definitions area:
;   (define str "helloworld")
;   (define i 5)
; Then create an expression using string primitives that
; adds "_" at position i. In general this means the
; resulting string is longer than the original one; here
; is the expected result is "hello_world"


; Exercise 4:
; Use the same setup as in exercise 3 to create an
; expression that deletes the ith position from str.
; Clearly this expression create a shorter string than
; the given one. Which values for i are legitimate?


; Exercise 5:
; Use the 2htdp/image library to create the image of a
; simple boat or tree. Make sure you can easily change the
; scale of the entire image
(require 2htdp/image)


; Exercise 6:
; Add the following line to the definitions area:
;   (define cat "paste-image-here")
; Create and expression that counts the number of pixels
; in the image


; Exercise 7:
; Suppose you want to decide whether today is an
; appropriate day to go to the mall. You go to the mall
; either if it is not sunny or if today is Friday
; (because that is when stores post new sales items).
; First, add these two lines to the definitions area of
; DrRacket:
;   (define sunny #true)
;   (define friday #false)
; Now create an expression that computes whether or not
; sunny is false or friday is true. So in this particular
; case, the answer is #false. (Why?)


; Exercise 8:
; Add the following line to the definitions area:
;   (define cat "paste-image-here")
; Create a conditional expression that computes whether
; the image is tall or wide. An image should be labeled
; "tall" if its height is larger than or equal to its
; width; otherwise it is "wide". See exercise 1 for how
; to create such expressions in DrRacket; as you
; experiment, replace the cat with a rectangle of your
; choice to ensure that you know the expected answer.
; Now try the following modification. Create an
; expression that computes whether a picture is "tall",
; "wide", or "square".


; Exercise 9:
; Add the following line to the definitions area of
; DrRacket:
;   (define in ...)
; Then create and expression that converts the value of
; in to a positive number. For a String, it determines how
; long the String is; for an Image, it uses the area; for
; a Number, it decrements the number by 1, unless it is
; already 0 or negative; for #true it uses 10 and for
; #false 20


; Exercise 10:
; Now relax, eat, sleep, and then tackle the next chapter


(define str "helloworld")
(define i 5)
(string-append (substring str 0 i) (substring str (+ i 1)))
(require 2htdp/image)
(define in "soo")
(if (number? in)

    (if (> in 0)
        (- in 1)
        (abs in))

    (if (string? in)

        (string-length in)

        (if (image? in)

            (* (image-width in) (image-height in))

            (if (= in #true)
                10
                20))))

; Exercise 11:
; Define a functino that consumes two numbers, x and y,
; and that computes the distance of point (x, y) to the
; origin

(define (f x y) (sqrt (+ (* x x) (* y y))))

; Exercise 12:
; Define the function cvolume, which accepts the length of
; a side of an equalateral cube and computes its volume.
; If you have time, consider defining csurface, too.

; Exercise 13:
; Define the function string-first, which extracts the
; first 1String from a non-empty string


; Exercise 14:
; Define the function string-last, which extracts the
; first 1String from a non-empty string.


; Exercise 15:
; Define ==>. The function consumes two Boolean values,
; call them sunny and friday. Its answer is #true if sunny
; is false or friday is true. Note Logicians call this
; Boolean operation implication and they use the notation
; sunny => friday for this purpose


; Exercise 16:
; Define the function image-area, which counts the
; number of pixels in a given image. See exercise 6 for
; ideas

; Exercise 17:
; Define the function image-classify, which consumes an
; image and conditionally produces "tall" if the image is
; taller than wide, "wide" if it is wider than tall, or
; "square" if its width and height are the same. See
; exercise 8 for ideas.

; Exercise 18:
; Define the function string-join, which consumes two
; strings and appends them with "_" in between. See
; exercise 2 for ideas.


; Exercise 19:
; Define the function string-insert, which consumes a
; string plus a number i and inserts "_" at the ith
; position of str. Assume i is a number between 0 and the
; length of the given string (inclusive). See exercise 3
; for ideas. Ponder how string-insert copes with "".


; Exercise 20:
; Define the function string-delete, which consumes a
; string plus a number i and deletes the ith position from
; str. Assume i is a number between 0 (inclusive) and the
; length of the given string (exclusive). See exercise 4
; for ideas. Can string-delete deal with empty strings?

; Exercise 21:
; Use DrRacket's stepper to evaluate (ff (ff 1))
; step-by-step. Also try (+ (ff 1) (ff 1)). Does
; DrRacket's stepper reuse the results of computations?



; Exercise 22:
; Use DrRacket's stepper on this programs fragment:
;  (define (distance-to-origin x y)
;    (sqrt (+ (sqr x) (sqr y))))
; (distance-to-origin 3 4)

; Exercise 23:
; The first 1String in "hello world" is "h". How does the
; following function compute this result?
;   (define (string-first s)
;     (substring s 0 1))
; Use the stepper to confirm your ideas



; Exercise 24:
; (define (==> x y)
;   (or (not x) y)



; Exercise 25:
; Take a look at this attempt to solve exercise 17
;   (define (image-classify img)
;     (cond
;       [(>= (image-height img) (image-width img)) "tall"]
;       [(= (image-height img) (image-width img)) "square"]
;       [(<= (image-height img) (image-width img) "wide")]))



; Exercise 26:
; What do you expect as the value of this program
; (define (string-insert s i)
;   (string-append (substring s 0 i)
;                  "-"
;                  (substring s i)))
; (string-insert "helloworld" 6)
; Confirm your expectation with DrRacket and its stepper



; Exercise 27:
; Our solution to the sample problem contains several
; constants in the middle of functions. As "One Programs,
; Many Definitions" already points out, it is best to give
; names to such constants so that future readers
; understant where these numbers come from. Collect all
; definitions in DrRacket's definitions area and change
; them so that all magic numbers are refactored into
; constant definitions.



; Exercise 28:
; Determine the potential profit for these ticket prices:
; $1, $2, $3, $4, and $5. Which price maximizes the profit
; of the movie theater? Determine the best ticket price to
; a dime.
; 
; Here is an alternate version of the same program, given
; as a single function definition
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
; Enter this definition into DrRacket and ensure that it
; produces the same results as the original version for
; $1, $2, $3, $4, and $5.



; Exercise 29:
; After studying the costs of a show, the owner discovered
; several ways of lowering the cost. As a result of these
; improvements, there is no longer a fixed cost; a variable
; cost of $1.50 per attendee remains. Modify both programs
; to reflect this change. When the programs are modified,
; test them again with ticket prices of $3, $4, and $5 and
; compare the results.



; Exercise 30:
; Define constants for the price optimization program at
; the movie theater so that the price sensitivity of
; attendance (15 people for every 10 cents) becomes a
; computed constant.



; Exercise 31:
; Recall the letter program from Composing Functions. Here
; is how to launch the program and have it write its output
; to the interactions area:
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
; Of course, programs are useful because you can launch
; them for many different inputs. Run letter on three
; inputs of your choice.



; Exercise 32:
; Most people no longer use desktop computers just to
; run applications but also employ cell phones, tablets,
; and their cars’ information control screen. Soon people
; will use wearable computers in the form of intelligent
; glasses, clothes, and sports gear. In the somewhat more
; distant future, people may come with built-in bio
; computers that directly interact with body functions.
; Think of ten different forms of events that software
; applications on such computers will have to deal with.



; Exercise 33:
; Research the “year 2000” problem and what it meant for
; software developers.



: Exercise 34:
; Design the function string-first, which extracts the
; first character from a non-empty string. Don’t worry
; about empty strings.



; Exercise 35: Design the function string-last, which
; extracts the last character from a non-empty string.



; Exercise 36: Design the function image-area, which
; counts the number of pixels in a given image.



; Exercise 37: Design the function string-rest, which
; produces a string like the given one with the first
; character removed.



; Exercise 38: Design the function string-remove-last,
; which produces a string like the given one with the
; last character removed.



; Exercise 39:
; We started the development of our car image with a
; single plain definition:
    (define WHEEL-RADIUS 5)
; The definition of WHEEL-DISTANCE is based on the wheel’s
; radius. Hence, changing WHEEL-RADIUS from 5 to 10 doubles
; the size of the car image. This kind of program 
; organization is dubbed single point of control, and good
; design employs this idea as much as possible.
; Develop your favorite image of an automobile so that 
; WHEEL-RADIUS remains the single point of control.



; Exercise 40:
; Formulate the examples as BSL tests, that is, using the
; check-expect form. Introduce a mistake. Re-run the tests.



; Exercise 41:
; Finish the sample problem and get the program to run.
; That is, assuming that you have solved exercise 39,
; define the constants BACKGROUND and Y-CAR. Then assemble
; all the function definitions, including their tests. When
; your program runs to your satisfaction, add a tree to the
; scenery. We used:
;   (define tree
;     (underlay/xy (circle 10 "solid" "green")
;                  9 15
;                  (rectangle 2 20 "solid" "brown")))
; to create a tree-like shape. Also add a clause to the
; big-bang expression that stops the animation when the car
; has disappeared on the right side.



; Exercise 42:
; Modify the interpretation of the sample data definition
; so that a state denotes the x-coordinate of the
; right-most edge of the car. 



; Exercise 43:
; Design the functions tock and render. Then develop a
; big-bang expression so that once again you get an
; animation of a car traveling from left to right across
; the world’s canvas.
;
; How do you think this program relates to animate from
; Prologue: How to Program?
;
; Use the data definition to design a program that moves
; the car according to a sine wave. (Don’t try to drive
; like that.)



; Exercise 44:
; Formulate the examples as BSL tests. Click RUN and watch
; them fail.



; Exercise 45:
; Design a “virtual cat” world program that continuously
; moves the cat from left to right. Let’s call it cat-prog
; and let’s assume it consumes the starting position of the
; cat. Furthermore, make the cat move three pixels per
; clock tick. Whenever the cat disappears on the right, it
; reappears on the left. You may wish to read up on the
; modulo function.



: Exercise 46:
; Improve the cat animation with a slightly different image:
;   (define cat2 'insert-image-here')
; Adjust the rendering function from exercise 45 so that it
; uses one cat image or the other based on whether the
; x-coordinate is odd. Read up on odd? in the HelpDesk, and
; use a cond expression to select cat images.



; Exercise 47:
; Design a world program that maintains and displays a
; “happiness gauge.” Let’s call it gauge-prog, and let’s
; agree that the program consumes the maximum level of
; happiness. The gauge display starts with the maximum
; score, and with each clock tick, happiness decreases by
; -0.1; it never falls below 0, the minimum happiness score.
; Every time the down arrow key is pressed, happiness
; increases by 1/5; every time the up arrow is pressed,
; happiness jumps by 1/3.
;
; To show the level of happiness, we use a scene with a
; solid, red rectangle with a black frame. For a happiness
; level of 0, the red bar should be gone; for the maximum
; happiness level of 100, the bar should go all the way
; across the scene.



; Exercise 48:
; Enter the definition of reward followed by (reward 18)
; into the definitions area of DrRacket and use the stepper
; to find out how DrRacket evaluates applications of the
; function.



; Exercise 49:
; A cond expression is really just an expression and may
; therefore show up in the middle of another expression:
;
;   (- 200 (cond [(> y 200) 0] [else y]))
;
; Use the stepper to evaluate the expression for y as 100
; and 210.
;
; Reformulate create-rocket-scene.v5 to use a nested
; expression; the resulting function mentions place-image
; only once.



; Exercise 50:
; If you copy and paste the above function definition into
; the definitions area of DrRacket and click RUN, DrRacket
; highlights two of the three cond lines. This coloring
; tells you that your test cases do not cover the full
; conditional. Add enough tests to make DrRacket happy.



; Exercise 51:
; Design a big-bang program that simulates a traffic light
; for a given duration. The program renders the state of a
; traffic light as a solid circle of the appropriate color,
; and it changes state on every clock tick. What is the
; most appropriate initial state? Ask your engineering
; friends.



; Exercise 52:
; Which integers are contained in the four intervals above?



; Exercise 53:
; The design recipe for world programs demands that you
; translate information into data and vice versa to ensure
; a complete understanding of the data definition. It’s
; best to draw some world scenarios and to represent them
; with data and, conversely, to pick some data examples and
; to draw pictures that match them. Do so for the LR
; definition, including at least HEIGHT and 0 as examples.



; Exercise 54:
; Why is (string=? "resting" x) incorrect as the first
; condition in show? Conversely, formulate a completely
; accurate condition, that is, a Boolean expression that
; evaluates to #true precisely when x belongs to the first
; sub-class of LRCD.



; Exercise 55:
; Take another look at show. It contains three instances of
; an expression with the approximate shape:
;
;   (place-image ROCKET 10 (- ... CENTER) BACKG)
;
; This expression appears three times in the function:
; twice to draw a resting rocket and once to draw a flying
; rocket. Define an auxiliary function that performs this
; work and thus shorten show. Why is this a good idea? You
; may wish to reread Prologue: How to Program.



; Exercise 56:
; Define main2 so that you can launch the rocket and watch
; it lift off. Read up on the on-tick clause to determine
; the length of one tick and how to change it.
;
; If you watch the entire launch, you will notice that once
; the rocket reaches the top something curious happens.
; Explain. Add a stop-when clause to main2 so that the
; simulation of the liftoff stops gracefully when the rocket
; is out of sight.



; Exercise 57:
; Recall that the word “height” forced us to choose one of
; two possible interpretations. Now that you have solved
; the exercises in this section, solve them again using the
; first interpretation of the word. Compare and contrast
; the solutions.



; Exercise 58:
; Introduce constant definitions that separate the intervals
; for low prices and luxury prices from the others so that
; the legislators in Tax Land can easily raise the taxes even
; more.



; Exercise 59:
; Finish the design of a world program that simulates the
; traffic light FSA. Here is the main function:
;   ; TrafficLight -> TrafficLight
;   ; simulates a clock-based American traffic light
;   (define (traffic-light-simulation initial-state)
;     (big-bang initial-state
;       [to-draw tl-render]
;       [on-tick tl-next 1]))
;
; The function’s argument is the initial state for the
; big-bang expression, which tells DrRacket to redraw the
; state of the world with tl-render and to handle clock
; ticks with tl-next. Also note that it informs the
; computer that the clock should tick once per second.
;
; Complete the design of tl-render and tl-next. Start with
; copying TrafficLight, tl-next, and tl-render into
; DrRacket’s definitions area.
;
; Here are some test cases for the design of the latter:
;
;   (check-expect (tl-render "red") "insert-image-here")
;   (check-expect (tl-render "yellow") "insert-image-here")
;
; Your function may use these images directly. If you
; decide to create images with the functions from the
; 2htdp/image library, design an auxiliary function for
; creating the image of a one-color bulb. Then read up on
; the place-image function, which can place bulbs into a
; background scene.



; Exercise 60:
; An alternative data representation for a traffic light
; program may use numbers instead of strings:
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
; Reformulate tl-next’s tests for tl-next-numeric.
; Does the tl-next function convey its intention more
; clearly than the tl-next-numeric function? If so, why? If
; not, why not?



; Exercise 61:
; Figure 27 displays two different functions that switch
; the state of a traffic light in a simulation program.
; Which of the two is properly designed using the recipe
; for itemization? Which of the two continues to work if
; you change the constants to the following
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
; During a door simulation the “open” state is barely
; visible. Modify door-simulation so that the clock ticks
; once every three seconds. Rerun the simulation.



; Exercise 63:
; Evaluate the following expressions:
;
;   (distance-to-0 (make-posn 3 4))
;
;   (distance-to-0 (make-posn 6 (* 2 4)))
;
;   (+ (distance-to-0 (make-posn 12 5)) 10)
;
; by hand. Show all steps. Assume that sqr performs its
; computation in a single step. Check the results with
; DrRacket’s stepper.



; Exercise 64:
; Design the function manhattan-distance, which measures
; the Manhattan distance of the given posn to the origin.



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
; Write down the names of the functions (constructors,
; selectors, and predicates) that each introduces.



; Exercise 66:
; Revisit the structure type definitions of exercise 65.
; Make sensible guesses as to what kind of values go with
; which fields. Then create at least one instance per
; structure type definition.



; Exercise 67:
; Here is another way to represent bouncing balls:
;
;   (define SPEED 3)
;   (define-struct balld [location direction])
;   (make-balld 10 "up")
;
; Interpret this code fragment and create other instances
; of balld.



; Exercise 68:
; An alternative to the nested data representation of
; balls uses four fields to keep track of the four
; properties:
;
;   (define-struct ballf [x y deltax deltay])
;
; Programmers call this a flat representation. Create an
; instance of ballf that has the same interpretation as
; ball1.



; Exercise 69:
; Draw box representations for the solution of exercise 65.



; Exercise 70:
; Spell out the laws for these structure type definitions:
;
;   (define-struct centry [name home office cell])
;   (define-struct phone [area number])
;
; Use DrRacket’s stepper to confirm 101 as the value of
; this expression:
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
; Explain the results with step-by-step computations.
; Double-check your computations with DrRacket’s stepper.



; Exercise 72:
; Formulate a data definition for the above phone
; structure type definition that accommodates the given
; examples.
;
; Next formulate a data definition for phone numbers using
; this structure type definition:
;
;   (define-struct phone# [area switch num])
;
; Historically, the first three digits make up the area
; code, the next three the code for the phone switch
; (exchange) of your neighborhood, and the last four the
; phone with respect to the neighborhood. Describe the
; content of the three fields as precisely as possible
; with intervals.



; Exercise 73:
; Design the function posn-up-x, which consumes a Posn p
; and a Number n. It produces a Posn like p with n in the
; x field.
;
; A neat observation is that we can define x+ using posn-up-x:
;
;   (define (x+ p)
;     (posn-up-x p (+ (posn-x p) 3)))
;
; Note Functions such as posn-up-x are often called
; updaters or functional setters. They are extremely
; useful when you write large programs.



; Exercise 74:
; Copy all relevant constant and function definitions to
; DrRacket’s definitions area. Add the tests and make sure
; they pass. Then run the program and use the mouse to
; place the red dot.



; Exercise 75:
; Enter these definitions and their test cases into the
; definitions area of DrRacket and make sure they work.
; This is the first time that you have dealt with a “wish,”
; and you need to make sure you understand how the two
; functions work together.



; Exercise 76:
; Formulate data definitions for the following structure
; type definitions:
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
; Make sensible assumptions as to what kind of values go
; into each field.



; Exercise 77:
; Provide a structure type definition and a data
; definition for representing points in time since
; midnight. A point in time consists of three numbers:
; hours, minutes, and seconds.



; Exercise 78:
; Provide a structure type and a data definition for
; representing three-letter words. A word consists of
; lowercase letters, represented with the 1Strings "a"
; through "z" plus #false. Note This exercise is a part
; of the design of a hangman game; see exercise 396.



; Exercise 79:



; Exercise 80:



; Exercise 81:



; Exercise 82:



; Exercise 83:



; Exercise 84:



; Exercise 85:



; Exercise 86:



; Exercise 87:



; Exercise 89:



; Exercise 88:



; Exercise 90:



; Exercise 91:



; Exercise 92:



; Exercise 93:



; Exercise 94:



; Exercise 95:



; Exercise 96:



; Exercise 97:



; Exercise 98:



; Exercise 99:



; Exercise 100:



; Exercise 101:



; Exercise 102:



; Exercise 103:



; Exercise 104:



; Exercise 105:



; Exercise 106:



; Exercise 107:



; Exercise 108:



; Exercise 109:



; Exercise 110:



; Exercise 111:



; Exercise 112:



; Exercise 113:



; Exercise 114:



; Exercise 115:


