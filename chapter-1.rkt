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