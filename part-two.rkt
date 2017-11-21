; Exercise 129:
; Create BSL lists that represent
;
;   a list of celestial bodies, say, at least all the planets in our solar
;   system;
;
;   a list of items for a meal, for example, steak, french fries, beans, bread,
;   water, Brie cheese, and ice cream; and
;
;   a list of colors.
;
; Sketch some box representations of these lists, similar to those in figures
; 44 and 45. Which of the sketches do you like better?


; Exercise 130:
; Create an element of List-of-names that contains five Strings. Sketch a box
; representation of the list similar to those found in figure 44.
;
; Explain why
;
;   (cons "1" (cons "2" '()))
;
; is an element of List-of-names and why (cons 2 '()) isn’t


; Exercise 131:
; Provide a data definition for representing lists of Boolean values. The class
; contains all arbitrarily long lists of Booleans.


; Exercise 132:
; Use DrRacket to run contains-flatt? in this example:
;
;   (cons "Fagan"
;     (cons "Findler"
;       (cons "Fisler"
;         (cons "Flanagan"
;           (cons "Flatt"
;             (cons "Felleisen"
;               (cons "Friedman" '())))))))
;
; What answer do you expect?

; Exercise 133:
; Here is another way of formulating the second cond clause in contains-flatt?:
;
;   ... (cond
;         [(string=? (first alon) "Flatt") #true]
;         [else (contains-flatt? (rest alon))]) ...
;
; Explain why this expression produces the same answers as the or expression in
; the version of figure 47. Which version is better? Explain.

; Exercise 134:
; Develop the contains? function, which determines whether some given string
; occurs on a given list of strings.
;
; Note BSL actually comes with member?, a function that consumes two values and
; checks whether the first occurs in the second, a list:
;
;   > (member? "Flatt" (cons "b" (cons "Flatt" '())))
;
;   #true
;
; Don’t use member? to define the contains? function.


; Exercise 135:
; Use DrRacket’s stepper to check the calculation for
;
;   (contains-flatt? (cons "Flatt" (cons "C" '())))
;
; Also use the stepper to determine the value of
;
;   (contains-flatt?
;     (cons "A" (cons "Flatt" (cons "C" '()))))
;
; What happens when "Flatt" is replaced with "B"?


; Exercise 136:
; Validate with DrRacket’s stepper
;
;   (our-first (our-cons "a" '())) == "a"
;   (our-rest (our-cons "a" '())) == '()
;
; See What Is '(), What Is cons for the definitions of these functions.


; Exercise 137:
; Compare the template for contains-flatt? with the one for how-many. Ignoring
; the function name, they are the same. Explain the similarity.


; Exercise 138:
;  Here is a data definition for representing sequences of amounts of money:
;
;   ; A List-of-amounts is one of: 
;   ; – '()
;   ; – (cons PositiveNumber List-of-amounts)
;
; Create some examples to make sure you understand the data definition. Also
; add an arrow for the self-reference.
;
; Design the sum function, which consumes a List-of-amounts and computes the
; sum of the amounts. Use DrRacket’s stepper to see how (sum l) works for a
; short list l in List-of-amounts.


; Exercise 139:
; Now take a look at this data definition:
;
;   ; A List-of-numbers is one of: 
;   ; – '()
;   ; – (cons Number List-of-numbers)
;
; Some elements of this class of data are appropriate inputs for sum from
; exercise 138 and some aren’t.
;
; Design the function pos?, which consumes a List-of-numbers and determines
; whether all numbers are positive numbers. In other words, if (pos? l) yields
; #true, then l is an element of List-of-amounts. Use DrRacket’s stepper to
; understand how pos? works for (cons 5 '()) and (cons -1 '()).
;
; Also design checked-sum. The function consumes a List-of-numbers. It produces
; their sum if the input also belongs to List-of-amounts; otherwise it signals
; an error. Hint Recall to use check-error.
;
; What does sum compute for an element of List-of-numbers?


; Exercise 140:
; Design the function all-true, which consumes a list of Boolean values and
; determines whether all of them are #true. In other words, if there is any
; #false on the list, the function produces #false.
;
; Now design one-true, a function that consumes a list of Boolean values and
; determines whether at least one item on the list is #true.


; Exercise 141:
; If you are asked to design the function cat, which consumes a list of strings and appends them all into one long string, you are guaranteed to end up with this partial definition:
;
;   ; List-of-string -> String
;   ; concatenates all strings in l into one long string
;     
;   (check-expect (cat '()) "")
;   (check-expect (cat (cons "a" (cons "b" '()))) "ab")
;   (check-expect
;     (cat (cons "ab" (cons "cd" (cons "ef" '()))))
;     "abcdef")
;     
;   (define (cat l)
;     (cond
;       [(empty? l) ""]
;       [else (... (first l) ... (cat (rest l)) ...)]))
;
; Fill in the table in figure 57. Guess a function that can create the desired
; result from the values computed by the sub-expressions.
;
; Use DrRacket’s stepper to evaluate (cat (cons "a" '())).


; Exercise 142:
; Design the ill-sized? function, which consumes a list of images loi and a
; positive number n. It produces the first image on loi that is not an n by n
; square; if it cannot find such an image, it produces #false.
;
; Hint Use
;
;   ; ImageOrFalse is one of:
;   ; – Image
;   ; – #false 
;
; for the result part of the signature.


; Exercise 143:
; Determine how average behaves in DrRacket when applied to the empty list.
; Then design checked-average, a function that produces an informative error
; message when it is applied to '().


; Exercise 144:
; Will sum and how-many work for NEList-of-temperatures even though they are
; designed for inputs from List-of-temperatures? If you think they don’t work,
; provide counter-examples. If you think they would, explain why.


; Exercise 145:
; Design the sorted>? predicate, which consumes a NEList-of-temperatures and
; produces #true if the temperatures are sorted in descending order. That is,
; if the second is smaller than the first, the third smaller than the second,
; and so on. Otherwise it produces #false.
;
; Hint This problem is another one where the table-based method for guessing
; the combinator works well. Here is a partial table for a number of examples
; in figure 58. Fill in the rest of the table. Then try to create an expression
; that computes the result from the pieces.


; Exercise 146:
; Design how-many for NEList-of-temperatures. Doing so completes average, so
; ensure that average passes all of its tests, too.


; Exercise 147:
; Develop a data definition for NEList-of-Booleans, a representation of
; non-empty lists of Boolean values. Then redesign the functions all-true and
; one-true from exercise 140.


; Exercise 148:
; Compare the function definitions from this section (sum, how-many, all-true,
; one-true) with the corresponding function definitions from the preceding
; sections. Is it better to work with data definitions that accommodate empty
; lists as opposed to definitions for non-empty lists? Why? Why not?


; Exercise 149:
; Does copier function properly when you apply it to a natural number and a
; Boolean or an image? Or do you have to design another function? Read
; Abstraction for an answer.
;
; An alternative definition of copier might use else:
;
;   (define (copier.v2 n s)
;     (cond
;       [(zero? n) '()]
;       [else (cons s (copier.v2 (sub1 n) s))]))
;
; How do copier and copier.v2 behave when you apply them to 0.1 and "x"?
; Explain. Use DrRacket’s stepper to confirm your explanation.


; Exercise 150:
; Design the function add-to-pi. It consumes a natural number n and adds it to
; pi without using the primitive + operation. Here is a start:
;
;   ; N -> Number
;   ; computes (+ n pi) without using +
;     
;   (check-within (add-to-pi 3) (+ 3 pi) 0.001)
;     
;   (define (add-to-pi n)
;     pi)
;
; Once you have a complete definition, generalize the function to add, which
; adds a natural number n to some arbitrary number x without using +. Why does
; the skeleton use check-within?


; Exercise 151:
; Design the function multiply. It consumes a natural number n and multiplies
; it with a number x without using *.
;
; Use DrRacket’s stepper to evaluate (multiply 3 x) for any x you like. How
; does multiply relate to what you know from grade school?


; Exercise 152:
; Design two functions: col and row.
;
; The function col consumes a natural number n and an image img. It produces a
; column—a vertical arrangement—of n copies of img.
;
; The function row consumes a natural number n and an image img. It produces a
; row—a horizontal arrangement—of n copies of img.


; Exercise 153:
; The goal of this exercise is to visualize the result of a 1968-style European
; student riot. Here is the rough idea. A small group of students meets to make
; paint-filled balloons, enters some lecture hall, and randomly throws the
; balloons at the attendees. Your program displays how the balloons color the
; seats in the lecture hall.
;
; Use the two functions from exercise 152 to create a rectangle of 8 by 18
; squares, each of which has size 10 by 10. Place it in an empty-scene of the
; same size. This image is your lecture hall.
;
; Design add-balloons. The function consumes a list of Posn whose coordinates
; fit into the dimensions of the lecture hall. It produces an image of the
; lecture hall with red dots added as specified by the Posns.
;
; Figure 60 shows the output of our solution when given some list of Posns. The
; left-most is the clean lecture hall, the second one is after two balloons
; have hit, and the last one is a highly unlikely distribution of 10 hits.
; Where is the 10th?


; Exercise 154:
; Design the function colors. It consumes a Russian doll and produces a string
; of all colors, separated by a comma and a space. Thus our example should
; produce
;
;   "yellow, green, red"


; Exercise 155:
; Design the function inner, which consumes an RD and produces the (color of
; the) innermost doll. Use DrRacket’s stepper to evaluate (inner rd) for your
; favorite rd.


; Exercise 156:
; Equip the program in figure 61 with tests and make sure it passes those.
; Explain what main does. Then run the program via main.


; Exercise 157:
; Experiment to determine whether the arbitrary decisions concerning constants
; are easy to change. For example, determine whether changing a single constant
; definition achieves the desired outcome:
;
;   change the height of the canvas to 220 pixels;
;
;   change the width of the canvas to 30 pixels;
;
;   change the x location of the line of shots to “somewhere to the left of the
;   middle”;
;
;   change the background to a green rectangle; and
;
;   change the rendering of shots to a red elongated rectangle.
;
; Also check whether it is possible to double the size of the shot without
; changing anything else or to change its color to black.


; Exercise 158:
; If you run main, press the space bar (fire a shot), and wait for a goodly
; amount of time, the shot disappears from the canvas. When you shut down the
; world canvas, however, the result is a world that still contains this
; invisible shot.
;
; Design an alternative tock function that doesn’t just move shots one pixel
; per clock tick but also eliminates those whose coordinates place them above
; the canvas. Hint You may wish to consider the design of an auxiliary function
; for the recursive cond clause.


; Exercise 159:
;  Turn the solution of exercise 153 into a world program. Its main function,
; dubbed riot, consumes how many balloons the students want to throw; its
; visualization shows one balloon dropping after another at a rate of one per
; second. The function produces the list of Posns where the balloons hit.
;
; Hints (1) Here is one possible data representation:
;
;   (define-struct pair [balloon# lob])
;   ; A Pair is a structure (make-pair N List-of-posns)
;   ; A List-of-posns is one of: 
;   ; – '()
;   ; – (cons Posn List-of-posns)
;   ; interpretation (make-pair n lob) means n balloons 
;   ; must yet be thrown and added to lob
;
; (2) A big-bang expression is really just an expression. It is legitimate to
; nest it within another expression.
;
; (3) Recall that random creates random numbers.


; Exercise 160:
; Design the functions set+.L and set+.R, which create a set by adding a number
; x to some given set s for the left-hand and right-hand data definition,
; respectively.


; Exercise 161:



; Exercise 162:



; Exercise 163:



; Exercise 164:



; Exercise 165:



; Exercise 166:



; Exercise 167:



; Exercise 168:



; Exercise 169:



; Exercise 170:



; Exercise 171:



; Exercise 172:



; Exercise 173:



; Exercise 174:



; Exercise 175:



; Exercise 176:



; Exercise 177:



; Exercise 178:



; Exercise 179:



; Exercise 180:



; Exercise 181:



; Exercise 182:



; Exercise 183:



; Exercise 184:



; Exercise 185:



; Exercise 186:



; Exercise 187:



; Exercise 188:



; Exercise 189:



; Exercise 190:



; Exercise 191:



; Exercise 192:



; Exercise 193:



; Exercise 194:



; Exercise 195:



; Exercise 196:



; Exercise 197:



; Exercise 198:



; Exercise 199:



; Exercise 200:



; Exercise 201:



; Exercise 202:



; Exercise 203:



; Exercise 204:



; Exercise 205:



; Exercise 206:



; Exercise 207:



; Exercise 208:



; Exercise 209:



; Exercise 210:



; Exercise 211:



; Exercise 212:



; Exercise 213:



; Exercise 214:



; Exercise 215:



; Exercise 216:



; Exercise 217:



; Exercise 218:



; Exercise 219:



; Exercise 220:



; Exercise 221:



; Exercise 222:



; Exercise 223:



; Exercise 224:



; Exercise 225:



; Exercise 226:



; Exercise 227:



; Exercise 228:



; Exercise 229:



; Exercise 230:


