;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chapter-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

        
        