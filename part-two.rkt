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
; If you are asked to design the function cat, which consumes a list of strings
; and appends them all into one long string, you are guaranteed to end up with
; this partial definition:
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
; Translate the examples into tests and make sure they all succeed. Then change
; the function in figure 64 so that everyone gets $14 per hour. Now revise the
; entire program so that changing the wage for everyone is a single change to
; the entire program and not several.


; Exercise 162:
; No employee could possibly work more than 100 hours per week. To protect the
; company against fraud, the function should check that no item of the input
; list of wage* exceeds 100. If one of them does, the function should
; immediately signal an error. How do we have to change the function in figure
; 64 if we want to perform this basic reality check?


; Exercise 163:
; Design convertFC. The function converts a list of measurements in Fahrenheit
; to a list of Celsius measurements.


; Exercise 164:
; Design the function convert-euro, which converts a list of US$ amounts into a
; list of € amounts. Look up the current exchange rate on the web.
;
; Generalize convert-euro to the function convert-euro*, which consumes an
; exchange rate and a list of US$ amounts and converts the latter into a list
; of € amounts.


; Exercise 165:
; Design the function subst-robot, which consumes a list of toy descriptions
; (one-word strings) and replaces all occurrences of "robot" with "r2d2"; all
; other descriptions remain the same.
;
; Generalize subst-robot to substitute. The latter consumes two strings, called
; new and old, and a list of strings. It produces a new list of strings by
; substituting all occurrences of old with new.


; Exercise 166:
; The wage*.v2 function consumes a list of work records and produces a list of
; numbers. Of course, functions may also produce lists of structures.
;
; Develop a data representation for paychecks. Assume that a paycheck contains
; two distinctive pieces of information: the employee’s name and an amount.
; Then design the function wage*.v3. It consumes a list of work records and
; computes a list of paychecks from it, one per record.
;
; In reality, a paycheck also contains an employee number. Develop a data
; representation for employee information and change the data definition for
; work records so that it uses employee information and not just a string for
; the employee’s name. Also change your data representation of paychecks so
; that it contains an employee’s name and number, too. Finally,
; design wage*.v4, a function that maps lists of revised work records to lists
; of revised paychecks.
;
; Note on Iterative Refinement This exercise demonstrates the iterative
; refinement of a task. Instead of using data representations that include all
; relevant information, we started from simplistic representation of paychecks
; and gradually made the representation realistic. For this simple program,
; refinement is overkill; later we will encounter situations where iterative
; refinement is not just an option but a necessity.


; Exercise 167:
; Design the function sum, which consumes a list of Posns and produces the sum
; of all of its x-coordinates.


; Exercise 168:
; Design the function translate. It consumes and produces lists of Posns. For
; each (make-posn x y) in the former, the latter contains
; (make-posn x (+ y 1)). We borrow the word “translate” from geometry, where
; the movement of a point by a constant distance along a straight line is
; called a translation.


; Exercise 169:
; Design the function legal. Like translate from exercise 168, the function
; consumes and produces a list of Posns. The result contains all those Posns
; whose x-coordinates are between 0 and 100 and whose y-coordinates are between
; 0 and 200.


; Exercise 170:
; Here is one way to represent a phone number:
;
;   (define-struct phone [area switch four])
;   ; A Phone is a structure: 
;   ;   (make-phone Three Three Four)
;   ; A Three is a Number between 100 and 999. 
;   ; A Four is a Number between 1000 and 9999. 
;
; Design the function replace. It consumes and produces a list of Phones. It
; replaces all occurrence of area code 713 with 281.


; Exercise 171:
; You know what the data definition for List-of-strings looks like. Spell it
; out. Make sure that you can represent Piet Hein’s poem as an instance of the
; definition where each line is represented as a string and another instance
; where each word is a string. Use read-lines and read-words to confirm your
; representation choices.
;
; Next develop the data definition for List-of-list-of-strings. Again,
; represent Piet Hein’s poem as an instance of the definition where each line
; is represented as a list of strings, one per word, and the entire poem is a
; list of such line representations. You may use read-words/line to confirm
; your choice.


; Exercise 172:
; Design the function collapse, which converts a list of lines into a string.
; The strings should be separated by blank spaces (" "). The lines should be
; separated with a newline ("\n").
;
; Challenge When you are finished, use the program like this:
;
;   (write-file "ttt.dat"
;               (collapse (read-words/line "ttt.txt")))
;
; To make sure the two files "ttt.dat" and "ttt.txt" are identical, remove all
; extraneous white spaces in your version of the T.T.T. poem.


; Exercise 173:
; Design a program that removes all articles from a text file. The program
; consumes the name n of a file, reads the file, removes the articles, and
; writes the result out to a file whose name is the result of concatenating
; "no-articles-" with n. For this exercise, an article is one of the following
; three words: "a", "an", and "the".
;
; Use read-words/line so that the transformation retains the organization of
; the original text into lines and words. When the program is designed, run it
; on the Piet Hein poem.


; Exercise 174:
; Design a program that encodes text files numerically. Each letter in a word
; should be encoded as a numeric three-letter string with a value between 0 and
; 256. Figure 69 shows our encoding function for single letters. Before you
; start, explain these functions.
;
; Hints (1) Use read-words/line to preserve the organization of the file into
; lines and words. (2) Read up on explode again.


; Exercise 175:
; Design a BSL program that simulates the Unix command wc. The purpose of the
; command is to count the number of 1Strings, words, and lines in a given file.
; That is, the command consumes the name of a file and produces a value that
; consists of three numbers.


; Exercise 176:
; Mathematics teachers may have introduced you to matrix calculations by now.
; In principle, matrix just means rectangle of numbers. Here is one possible
; data representation for matrices:
;
;   ; A Matrix is one of: 
;   ;  – (cons Row '())
;   ;  – (cons Row Matrix)
;   ; constraint all rows in matrix are of the same length
;    
;   ; A Row is one of: 
;   ;  – '() 
;   ;  – (cons Number Row)
;
; Note the constraints on matrices. Study the data definition and translate the
; two-by-two matrix consisting of the numbers 11, 12, 21, and 22 into this data
; representation. Stop, don’t read on until you have figured out the data 
; examples.
;
; Here is the solution for the five-second puzzle:
;
;   (define row1 (cons 11 (cons 12 '())))
;   (define row2 (cons 21 (cons 22 '())))
;   (define mat1 (cons row1 (cons row2 '())))
;
; If you didn’t create it yourself, study it now.
;
; The function in figure 70 implements the important mathematical operation of
; transposing the entries in a matrix. To transpose means to mirror the entries
; along the diagonal, that is, the line from the top-left to the bottom-right.
;
; Stop! Transpose mat1 by hand, then read figure 70. Why does transpose ask
; (empty? (first lln))?
;
; The definition assumes two auxiliary functions:
;
;   first*, which consumes a matrix and produces the first column as a list of
;   numbers; and
;
;   rest*, which consumes a matrix and removes the first column. The result is
;   a matrix.
;
; Even though you lack definitions for these functions, you should be able to
; understand how transpose works. You should also understand that you cannot
; design this function with the design recipes you have seen so far. Explain 
; why.
;
; Design the two wish-list functions. Then complete the design of transpose
; with some test cases.


; Exercise 177:
; Design the function create-editor. The function consumes two strings and
; produces an Editor. The first string is the text to the left of the cursor
; and the second string is the text to the right of the cursor. The rest of the
;  section relies on this function.


; Exercise 178:
; Explain why the template for editor-kh deals with "\t" and "\r" before it 
; checks for strings of length 1.


; Exercise 179:
; Design the functions
;
;   ; Editor -> Editor
;   ; moves the cursor position one 1String left, 
;   ; if possible 
;   (define (editor-lft ed) ed)
;     
;   ; Editor -> Editor
;   ; moves the cursor position one 1String right, 
;   ; if possible 
;   (define (editor-rgt ed) ed)
;     
;   ; Editor -> Editor
;   ; deletes a 1String to the left of the cursor,
;   ; if possible 
;   (define (editor-del ed) ed)
;
; Again, it is critical that you work through a good range of examples.


; Exercise 180:
; Design editor-text without using implode.


; Exercise 181:
; Use list to construct the equivalent of these lists:
;
;   (cons "a" (cons "b" (cons "c" (cons "d" '()))))
;
;   (cons (cons 1 (cons 2 '())) '())
;
;   (cons "a" (cons (cons 1 '()) (cons #false '())))
;
;   (cons (cons "a" (cons 2 '())) (cons "hello" '()))
;
; Also try your hand at this one:
;
;   (cons (cons 1 (cons 2 '()))
;         (cons (cons 2 '())
;               '()))
;
; Start by determining how many items each list and each nested list contains.
; Use check-expect to express your answers; this ensures that your
; abbreviations are really the same as the long-hand.


; Exercise 182:
;  Use cons and '() to form the equivalent of these lists:
;
;   (list 0 1 2 3 4 5)
;
;   (list (list "he" 0) (list "it" 1) (list "lui" 14))
;
;   (list 1 (list 1 2) (list 1 2 3))
;
; Use check-expect to express your answers.


; Exercise 183:
; On some occasions lists are formed with cons and list.
;
;   (cons "a" (list 0 #false))
;
;   (list (cons 1 (cons 13 '())))
;
;   (cons (list 1 (list 13 '())) '())
;
;   (list '() '() (cons 1 '()))
;
;   (cons "a" (cons (list 1) (list #false '())))
;
; Reformulate each of the following expressions using only cons or only list.
; Use check-expect to check your answers.


; Exercise 184:
; Determine the values of the following expressions:
;
;   (list (string=? "a" "b") #false)
;
;   (list (+ 10 20) (* 10 20) (/ 10 20))
;
;   (list "dana" "jane" "mary" "laura")
;
; Use check-expect to express your answers.


; Exercise 185:
; You know about first and rest from BSL, but BSL+ comes with even more
; selectors than that. Determine the values of the following expressions:
;
;   (first (list 1 2 3))
;
;   (rest (list 1 2 3))
;
;   (second (list 1 2 3))
;
; Find out from the documentation whether third and fourth exist.


; Exercise 186:
; Take a second look at Intermezzo 1: Beginning Student Language, the
; intermezzo that presents BSL and its ways of formulating tests. One of the
; latter is check-satisfied, which determines whether an expression satisfies a
; certain property. Use sorted>? from exercise 145 to reformulate the tests for
; sort> with check-satisfied.
;
; Now consider this function definition:
;
;   ; List-of-numbers -> List-of-numbers
;   ; produces a sorted version of l
;   (define (sort>/bad l)
;     (list 9 8 7 6 5 4 3 2 1 0))
;
; Can you formulate a test case that shows that sort>/bad is not a sorting
; function? Can you use check-satisfied to formulate this test case?
;
; Notes (1) What may surprise you here is that we define a function to create a
; test. In the real world, this step is common, and, on occasion, you really 
; need to design functions for tests—with their own tests and all. (2) 
; Formulating tests with check-satisfied is occasionally easier than using
; check-expect (or other forms), and it is also a bit more general. When the
; predicate completely describes the relationship between all possible inputs 
; and outputs of a function, computer scientists speak of a specification.
; Specifying with lambda explains how to specify sort> completely.


; Exercise 187:
; Design a program that sorts lists of game players by score:
;
;   (define-struct gp [name score])
;   ; A GamePlayer is a structure: 
;   ;    (make-gp String Number)
;   ; interpretation (make-gp p s) represents player p who 
;   ; scored a maximum of s points 
;
; Hint Formulate a function that compares two elements of GamePlayer.


; Exercise 188:
; Design a program that sorts lists of emails by date:
;
;   (define-struct email [from date message])
;   ; An Email Message is a structure: 
;   ;   (make-email String Number String)
;   ; interpretation (make-email f d m) represents text m 
;   ; sent by f, d seconds after the beginning of time 
;
; Also develop a program that sorts lists of email messages by name. To compare
; two strings alphabetically, use the string<? primitive.


; Exercise 189:
; Here is the function search:
;
;   ; Number List-of-numbers -> Boolean
;   (define (search n alon)
;     (cond
;       [(empty? alon) #false]
;       [else (or (= (first alon) n)
;                 (search n (rest alon)))]))
;
; It determines whether some number occurs in a list of numbers. The function 
; may have to traverse the entire list to find out that the number of interest 
; isn’t contained in the list.
;
; Develop the function search-sorted, which determines whether a number occurs 
; in a sorted list of numbers. The function must take advantage of the fact 
; that the list is sorted.


; Exercise 190:
; Design the prefixes function, which consumes a list of 1Strings and produces 
; the list of all prefixes. A list p is a prefix of l if p and l are the same 
; up through all items in p. For example, (list "a" "b" "c") is a prefix of 
; itself and (list "a" "b" "c" "d").
;
; Design the function suffixes, which consumes a list of 1Strings and produces 
; all suffixes. A list s is a suffix of l if p and l are the same from the end,
; up through all items in s. For example, (list "b" "c" "d") is a suffix of
; itself and (list "a" "b" "c" "d").


; Exercise 191:
; Adapt the second example for the render-poly function to connect-dots.


; Exercise 192:
; Argue why it is acceptable to use last on Polygons. Also argue why you may 
; adapt the template for connect-dots to last:
;
;   (define (last p)
;     (cond
;       [(empty? (rest p)) (... (first p) ...)]
;       [else (... (first p) ... (last (rest p)) ...)]))
;
; Finally, develop examples for last, turn them into tests, and ensure that 
; the definition of last in figure 73 works on your examples.


; Exercise 193:
; Here are two more ideas for defining render-poly:
;
;   render-poly could cons the last item of p onto p and then call 
;   connect-dots.
;
;   render-poly could add the first item of p to the end of p via a version of 
;   add-at-end that works on Polygons.
;
; Use both ideas to define render-poly; make sure both definitions pass the 
; test cases.


; Exercise 194:
; Modify connect-dots so that it consumes an additional Posn to which the last 
; Posn is connected. Then modify render-poly to use this new version of 
; connect-dots.


; Exercise 195:
; Design the function starts-with#, which consumes a Letter and Dictionary and
; then counts how many words in the given Dictionary start with the given 
; Letter. Once you know that your function works, determine how many words 
; start with "e" in your computer’s dictionary and how many with "z". 


; Exercise 196:
; Design count-by-letter. The function consumes a Dictionary and counts how 
; often each letter is used as the first one of a word in the given dictionary. 
; Its result is a list of Letter-Counts, a piece of data that combines letters 
; and counts.
;
; Once your function is designed, determine how many words appear for all 
; letters in your computer’s dictionary.
;
; Note on Design Choices An alternative is to design an auxiliary function that 
; consumes a list of letters and a dictionary and produces a list of 
; Letter-Counts that report how often the given letters occur as first ones in 
; the dictionary. You may of course reuse your solution of exercise 195. Hint 
; If you design this variant, notice that the function consumes two lists, 
; requiring a design problem that is covered in Simultaneous Processing in 
; detail. Think of Dictionary as an atomic piece of data that is along for the 
; ride and is handed over to starts-with# as needed.


; Exercise 197:
; Design most-frequent. The function consumes a Dictionary. It produces the 
; Letter-Count for the letter that occurs most often as the first one in the 
; given Dictionary.
;
; What is the most frequently used letter in your computer’s dictionary and how
; often is it used?
;
; Note on Design Choices This exercise calls for the composition of the 
; solution to the preceding exercise with a function that picks the correct
; pairing from a list of Letter-Counts. There are two ways to design this 
; latter function:
;
;   Design a function that picks the pair with the maximum count.
;
;   Design a function that selects the first from a sorted list of pairs.
;
; Consider designing both. Which one do you prefer? Why?


; Exercise 198:
; Design words-by-first-letter. The function consumes a Dictionary and produces
; a list of Dictionarys, one per Letter.
;
; Redesign most-frequent from exercise 197 using this new function. Call the 
; new function most-frequent.v2. Once you have completed the design, ensure 
; that the two functions compute the same result on your computer’s dictionary:
;
;   (check-expect
;     (most-frequent DICTIONARY-AS-LIST)
;     (most-frequent.v2 DICTIONARY-AS-LIST))
;
; Note on Design Choices For words-by-first-letter you have a choice for 
; dealing with the situation when the given dictionary does not contain any 
; words for some letter:
;
;   One alternative is to exclude the resulting empty dictionaries from the 
;   overall result. Doing so simplifies both the testing of the function and the 
;   design of most-frequent.v2, but it also requires the design of an auxiliary 
;   function.
;
;   The other one is to include '() as the result of looking for words of a 
;   certain letter, even if there aren’t any. This alternative avoids the 
;   auxiliary function needed for the first alternative but adds complexity to 
;   the design of most-frequent.v2. End
;
; Note on Intermediate Data and Deforestation This second version of the 
; word-counting function computes the desired result via the creation of a 
; large intermediate data structure that serves no real purpose other than that
; its parts are counted. On occasion, the programming language eliminates them
; automatically by fusing the two functions into one, a transformation on 
; programs that is also called deforestation. When you know that the language 
; does not deforest programs, consider eliminating such data structures if the 
; program does not process data fast enough.


; Exercise 199:
; While the important data definitions are already provided, the first step of
; the design recipe is still incomplete. Make up examples of Dates, Tracks, and
; LTracks. These examples come in handy for the following exercises as inputs.


; Exercise 200:
; Design the function total-time, which consumes an element of LTracks and 
; produces the total amount of play time. Once the program is done, compute the
; total play time of your iTunes collection.


; Exercise 201:
; Design select-all-album-titles. The function consumes an LTracks and produces
; the list of album titles as a List-of-strings.

; Also design the function create-set. It consumes a List-of-strings and 
; constructs one that contains every String from the given list exactly once.
; Hint If String s is at the front of the given list and occurs in the rest of
; the list, too, create-set does not keep s.
;
; Finally design select-album-titles/unique, which consumes an LTracks and 
; produces a list of unique album titles. Use this function to determine all 
; album titles in your iTunes collection and also find out how many distinct 
; albums it contains.


; Exercise 202:
; Design select-album. The function consumes the title of an album and an
; LTracks. It extracts from the latter the list of tracks that belong to the
; given album.


; Exercise 203:
; Design select-album-date. The function consumes the title of an album, a
; date, and an LTracks. It extracts from the latter the list of tracks that
; belong to the given album and have been played after the given date. Hint
; You must design a function that consumes two Dates and determines whether
; the first occurs before the second.


; Exercise 204:
; Design select-albums. The function consumes an element of LTracks. It
; produces a list of LTracks, one per album. Each album is uniquely identified
; by its title and shows up in the result only once. Hints (1) You want to use
; some of the solutions of the preceding exercises. (2) The function that
; groups consumes two lists: the list of album titles and the list of tracks;
; it considers the latter as atomic until it is handed over to an auxiliary
; function. See exercise 196.


; Exercise 205:
; Develop examples of LAssoc and LLists, that is, the list representation of
; tracks and lists of such tracks.


; Exercise 206:
; Design the function find-association. It consumes three arguments: a String
; called key, an LAssoc, and an element of Any called default. It produces the
; first Association whose first item is equal to key, or default if there is no
; such Association.
;
; Note Read up on assoc after you have designed this function.


; Exercise 207:
; Design total-time/list, which consumes an LLists and produces the total
; amount of play time. Hint Solve exercise 206 first.
;
; Once you have completed the design, compute the total play time of your
; iTunes collection. Compare this result with the time that the total-time
; function from exercise 200 computes. Why is there a difference?


; Exercise 208:
; Design boolean-attributes. The function consumes an LLists and produces the
; Strings that are associated with a Boolean attribute. Hint Use create-set
; from exercise 201.
;
; Once you are done, determine how many Boolean-valued attributes your iTunes
; library employs for its tracks. Do they make sense?


; Exercise 209:
; The above leaves us with two additional wishes: a function that consumes a
; String and produces its corresponding Word, and a function for the opposite
; direction. Here are the wish-list entries:
;
;   ; String -> Word
;   ; converts s to the chosen word representation 
;   (define (string->word s) ...)
;     
;   ; Word -> String
;   ; converts w to a string
;   (define (word->string w) ...)
;
; Look up the data definition for Word in the next section and complete the
; definitions of string->word and word->string. Hint You may wish to look in
; the list of functions that BSL provides.


; Exercise 210:
; Complete the design of the words->strings function specified in figure 78.
; Hint Use your solution to exercise 209.


; Exercise 211:
; Complete the design of in-dictionary, specified in figure 78. Hint See
; Real-World Data: Dictionaries for how to read a dictionary.


; Exercise 212:
; Write down the data definition for List-of-words. Make up examples of Words
; and List-of-words. Finally, formulate the functional example from above with
; check-expect. Instead of the full example, consider working with a word of
; just two letters, say "d" and "e".


; Exercise 213:
; Design insert-everywhere/in-all-words. It consumes a 1String and a list of
; words. The result is a list of words like its second argument, but with the
; first argument inserted at the beginning, between all letters, and at the end
; of all words of the given list.
;
; Start with a complete wish-list entry. Supplement it with tests for empty
; lists, a list with a one-letter word, and another list with a two-letter
; word, and the like. Before you continue, study the following three hints
; carefully.
;
; Hints (1) Reconsider the example from above. It says that "d" needs to be
; inserted into the words (list "e" "r") and (list "r" "e"). The following
; application is therefore one natural candidate for an example:
;
;   (insert-everywhere/in-all-words "d"
;     (cons (list "e" "r")
;       (cons (list "r" "e")
;         '())))
;
; (2) You want to use the BSL+ operation append, which consumes two lists and
; produces the concatenation of the two lists:
;
;   > (append (list "a" "b" "c") (list "d" "e"))
;
;   (list "a" "b" "c" "d" "e")
;
; The development of functions like append is the subject of Simultaneous
; Processing.
;
; (3) This solution of this exercise is a series of functions. Patiently stick
; to the design recipe and systematically work through your wish list.


; Exercise 214:
; Integrate arrangements with the partial program from Word Games, Composition
; Illustrated. After making sure that the entire suite of tests passes, run it
; on some of your favorite examples.


; Exercise 215:
; Design a world program that continually moves a one-segment worm and enables
; a player to control the movement of the worm with the four cardinal arrow
; keys. Your program should use a red disk to render the one-and-only segment
; of the worm. For each clock tick, the worm should move a diameter.
;
; Hints (1) Reread Designing World Programs to recall how to design world
; programs. When you define the worm-main function, use the rate at which the
; clock ticks as its argument. See the documentation for on-tick on how to
; describe the rate. (2) When you develop a data representation for the worm,
; contemplate the use of two different kinds of representations: a physical
; representation and a logical one. The physical representation keeps track of
; the actual physical position of the worm on the canvas; the logical one
; counts how many (widths of) segments the worm is from the left and the top.
; For which of the two is it easier to change the physical appearances (size of
; worm segment, size of game box) of the “game”?


; Exercise 216:
; Modify your program from exercise 215 so that it stops if the worm has
; reached the walls of the world. When the program stops because of this
; condition, it should render the final scene with the text "worm hit border"
; in the lower left of the world scene. Hint You can use the stop-when clause
; in big-bang to render the last world in a special way.


; Exercise 217:
; Develop a data representation for worms with tails. A worm’s tail is a
; possibly empty sequence of “connected” segments. Here “connected” means that
; the coordinates of a segment differ from those of its predecessor in at most
; one direction. To keep things simple, treat all segments—head and tail
; segments—the same.
;
; Now modify your program from exercise 215 to accommodate a multi-segment
; worm. Keep things simple: (1) your program may render all worm segments as
; red disks and (2) ignore that the worm may run into the wall or itself. Hint
; One way to realize the worm’s movement is to add a segment in the direction
; in which it is moving and to delete the last one.


; Exercise 218:
; Redesign your program from exercise 217 so that it stops if the worm has run
; into the walls of the world or into itself. Display a message like the one in
; exercise 216 to explain whether the program stopped because the worm hit the
; wall or because it ran into itself.
;
; Hints (1) To determine whether a worm is going to run into itself, check
; whether the position of the head would coincide with one of its old tail
; segments if it moved. (2) Read up on the member? function.


; Exercise 219:
; Equip your program from exercise 218 with food. At any point in time, the box
; should contain one piece of food. To keep things simple, a piece of food is
; of the same size as a worm segment. When the worm’s head is located at the
; same position as the food, the worm eats the food, meaning the worm’s tail is
; extended by one segment. As the piece of food is eaten, another one shows up
; at a different location.
;
; Adding food to the game requires changes to the data representation of world
; states. In addition to the worm, the states now also include a representation
; of the food, especially its current location. A change to the game
; representation suggests new functions for dealing with events, though these
; functions can reuse the functions for the worm (from exercise 218) and their
; test cases. It also means that the tick handler must not only move the worm;
; in addition it must manage the eating process and the creation of new food.
;
; Your program should place the food randomly within the box. To do so
; properly, you need a design technique that you haven’t seen before—so-called
; generative recursion, which is introduced in Generative Recursion—so we
; provide these functions in figure 80. Before you use them, however, explain
; how these functions work—assuming MAX is greater than 1—and then formulate
; purpose statements.
; 
; Hints (1) One way to interpret “eating” is to say that the head moves where
; the food used to be located and the tail grows by one segment, inserted
; where the head used to be. Why is this interpretation easy to design as a
; function? (2) We found it useful to add a second parameter to the worm-main
; function for this last step, a Boolean that determines whether big-bang
; displays the current state of the world in a separate window; see the
; documentation for state on how to ask for this information.


; Exercise 220:
; When you are presented with a complex data definition—like the one for the
; state of a Tetris game—you start by creating instances of the various data
; collections. Here are some suggestive names for examples you can later use
; for functional examples:
;
;   (define landscape0 ...)
;   (define block-dropping ...)
;   (define tetris0 ...)
;   (define tetris0-drop ...)
;   ...
;   (define block-landed (make-block 0 (- HEIGHT 1)))
;   ...
;  (define block-on-block (make-block 0 (- HEIGHT 2)))
;
; Design the program tetris-render, which turns a given instance of Tetris into
; an Image. Use DrRacket’s interactions area to develop the expression that
; renders some of your (extremely) simple data examples. Then formulate the
; functional examples as unit tests and the function itself.


; Exercise 221:
; Design the interactive program tetris-main, which displays blocks dropping in
; a straight line from the top of the canvas and landing on the floor or on
; blocks that are already resting. The input to tetris-main should determine
; the rate at which the clock ticks. See the documentation of on-tick for how
; to specify the rate.
;
; To discover whether a block landed, we suggest you drop it and check whether
; it is on the floor or it overlaps with one of the blocks on the list of
; resting blocks. Hint Read up on the member? primitive.
; 
; When a block lands, your program should immediately create another block that
; descends on the column to the right of the current one. If the current block
; is already in the right-most column, the next block should use the left-most
; one. Alternatively, define the function block-generate, which randomly
; selects a column different from the current one; see exercise 219 for
; inspiration.


; Exercise 222:
; Modify the program from exercise 221 so that a player can control the
; horizontal movement of the dropping block. Each time the player presses the
; "left" arrow key, the dropping block should shift one column to the left
; unless it is in column 0 or there is already a stack of resting blocks to its
; left. Similarly, each time the player presses "right", the dropping block
; should move one column to the right if possible.


; Exercise 223:
; Equip the program from exercise 222 with a stop-when clause. The game ends
; when one of the columns contains enough blocks to “touch” the top of the
; canvas.


; Exercise 224:
; Use the lessons learned from the preceding two sections and design the game
; extension slowly, adding one feature of the game after another. Always use
; the design recipe and rely on the guidelines for auxiliary functions. If you
; like the game, add other features: show a running text; equip the UFO with
; charges that can eliminate the tank; create an entire fleet of attacking
; UFOs; and above all, use your imagination.


; Exercise 225:
; Design a fire-fighting game.
;
; The game is set in the western states where fires rage through vast forests.
; It simulates an airborne fire-fighting effort. Specifically, the player acts
; as the pilot of an airplane that drops loads of water on fires on the ground.
; The player controls the plane’s horizontal movements and the release of water
; loads.
;
; Your game software starts fires at random places on the ground. You may wish
; to limit the number of fires, making them a function of how many fires are
; currently burning or other factors. The purpose of the game is to extinguish
; all fires in a limited amount of time. Hint Use an iterative design approach
; as illustrated in this chapter to create this game.


; Exercise 226:
; Design state=?, an equality predicate for states.


; Exercise 227:
; The BW Machine is an FSM that flips from black to white and back to black for
; every key event. Formulate a data representation for the BW Machine.


; Exercise 228:
; Complete the design of find.
;
; Once the auxiliary functions are tested, use simulate to play with
; fsm-traffic and the BW Machine from exercise 227.


; Exercise 229:
; Here is a revised data definition for Transition:
;
;   (define-struct ktransition [current key next])
;   ; A Transition.v2 is a structure:
;   ;   (make-ktransition FSM-State KeyEvent FSM-State)
;
; Represent the FSM from exercise 109 using lists of Transition.v2s; ignore
; errors and final states.
;
; Modify the design of simulate so that it deals with keystrokes in the
; appropriate manner now. Follow the design recipe, starting with the
; adaptation of the data examples.
;
; Use the revised program to simulate a run of the FSM from exercise 109 on the
; following sequence of keystrokes: "a", "b", "b", "c", and "d".


; Exercise 230:
; Consider the following data representation for FSMs:
;
;   (define-struct fsm [initial transitions final])
;   (define-struct transition [current key next])
;   ; An FSM.v2 is a structure: 
;   ;   (make-fsm FSM-State LOT FSM-State)
;   ; A LOT is one of: 
;   ; – '() 
;   ; – (cons Transition.v3 LOT)
;   ; A Transition.v3 is a structure: 
;   ;   (make-transition FSM-State KeyEvent FSM-State)
;
; Represent the FSM from exercise 109 in this context.
;
; Design the function fsm-simulate, which accepts an FSM.v2 and runs it on a
; player’s keystrokes. If the sequence of keystrokes forces the FSM.v2 to reach
; a final state, fsm-simulate stops. Hint The function uses the initial field
; of the given fsm structure to track the current state.