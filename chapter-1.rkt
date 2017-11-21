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



; Exercise 37: Design the function string-rest, whic
; produces a string like the given one with the first
; character removed.



; Exercise 38: Design the function string-remove-last,
; which produces a string like the given one with the
; last character removed.