; Exercise 310:
; Develop count-persons. The function consumes a family tree and counts the
; child structures in the tree.


; Exercise 311:
; Develop the function average-age. It consumes a family tree and the current
; year. It produces the average age of all child structures in the family tree.


; Exercise 312:
; Develop the function eye-colors, which consumes a family tree and produces a
; list of all eye colors in the tree. An eye color may occur more than once in
; the resulting list. Hint Use append to concatenate the lists resulting from
; the recursive calls.


; Exercise 313:
; Suppose we need the function blue-eyed-ancestor?, which is like
; blue-eyed-child? but responds with #true only when a proper ancestor, not the
; given child itself, has blue eyes.
;
; Although the goals clearly differ, the signatures are the same:
;
;   ; FT -> Boolean
;   (define (blue-eyed-ancestor? an-ftree) ...)
;
; Stop! Formulate a purpose statement for the function.
;
; To appreciate the difference, we take a look at Eva:
;
;   (check-expect (blue-eyed-child? Eva) #true)
;
; Eva is blue-eyed, but has no blue-eyed ancestor. Hence,
;
;   (check-expect (blue-eyed-ancestor? Eva) #false)
;
; In contrast, Gustav is Eva’s son and does have a blue-eyed ancestor:
;
;   (check-expect (blue-eyed-ancestor? Gustav) #true)
;
; Now suppose a friend comes up with this solution:
;
;   (define (blue-eyed-ancestor? an-ftree)
;     (cond
;       [(no-parent? an-ftree) #false]
;       [else
;        (or
;          (blue-eyed-ancestor?
;            (child-father an-ftree))
;          (blue-eyed-ancestor?
;            (child-mother an-ftree)))]))
;
; Explain why this function fails one of its tests. What is the result of
; (blue-eyed-ancestor? A) no matter which A you choose? Can you fix your
; friend’s solution?


; Exercise 314:
; Reformulate the data definition for FF with the List-of abstraction. Now do
; the same for the blue-eyed-child-in-forest? function. Finally, define
; blue-eyed-child-in-forest? using one of the list abstractions from the
; preceding chapter.


; Exercise 315:
; Design the function average-age. It consumes a family forest and a year (N).
; From this data, it produces the average age of all child instances in the
; forest. Note If the trees in this forest overlap, the result isn’t a true
; average because some people contribute more than others. For this exercise,
; act as if the trees don’t overlap.


; Exercise 316:
; Define the atom? function.


; Exercise 317:
; A program that consists of three connected functions ought to express this
; relationship with a local expression.
;
; Copy and reorganize the program from figure 117 into a single function using
; local. Validate the revised code with the test suite for count.
;
; The second argument to the local functions, sy, never changes. It is always
; the same as the original symbol. Hence you can eliminate it from the local
; function definitions to tell the reader that sy is a constant across the
; traversal process.


; Exercise 318:
; Design depth. The function consumes an S-expression and determines its depth.
; An Atom has a depth of 1. The depth of a list of S-expressions is the maximum
; depth of its items plus 1.


; Exercise 319:
; Design substitute. It consumes an S-expression s and two symbols, old and
; new. The result is like s with all occurrences of old replaced by new.


; Exercise 320:
; Reformulate the data definition for S-expr so that the first clause is
; expanded into the three clauses of Atom and the second clause uses the
; List-of abstraction. Redesign the count function for this data definition.
;
; Now integrate the definition of SL into the one for S-expr. Simplify count
; again. Consider using lambda.
;
; Note This kind of simplification is not always possible, but experienced
; programmers tend to recognize such opportunities.


; Exercise 321:
; Abstract the data definitions for S-expr and SL so that they abstract over
; the kinds of Atoms that may appear.


; Exercise 322:
; Draw the above two trees in the manner of figure 119. Then design
; contains-bt?, which determines whether a given number occurs in some given
; BT.


; Exercise 323:
; Design search-bt. The function consumes a number n and a BT. If the tree
; contains a node structure whose ssn field is n, the function produces the
; value of the name field in that node. Otherwise, the function produces
; #false.
;
; Hint Consider using contains-bt? to check the entire tree first or boolean?
; to check the result of the natural recursion at each stage.


; Exercise 324:
; Design the function inorder. It consumes a binary tree and produces the
; sequence of all the ssn numbers in the tree as they show up from left to
; right when looking at a tree drawing.
;
; Hint Use append, which concatenates lists like thus:
;
;   (append (list 1 2 3) (list 4) (list 5 6 7))
;   ==
;   (list 1 2 3 4 5 6 7)
;
; What does inorder produce for a binary search tree?


; Exercise 325:
; Design search-bst. The function consumes a number n and a BST. If the tree
; contains a node whose ssn field is n, the function produces the value of the
; name field in that node. Otherwise, the function produces NONE. The function
; organization must exploit the BST invariant so that the function performs as
; few comparisons as necessary.
;
; See exercise 189 for searching in sorted lists. Compare!


; Exercise 326:
; Design the function create-bst. It consumes a BST B, a number N, and a symbol
; S. It produces a BST that is just like B and that in place of one NONE
; subtree contains the node structure
;
;   (make-node N S NONE NONE)
;
; Once the design is completed, use the function on tree A from figure 119. 


; Exercise 327:
; Design the function create-bst-from-list. It consumes a list of numbers and
; names and produces a BST by repeatedly applying create-bst. Here is the
; signature:
;
;   ; [List-of [List Number Symbol]] -> BST
;
; Use the complete function to create a BST from this sample input:
;
;   '((99 o)
;     (77 l)
;     (24 i)
;     (10 h)
;     (95 g)
;     (15 d)
;     (89 c)
;     (29 b)
;     (63 a))
;
; The result is tree A in figure 119, if you follow the structural design
; recipe. If you use an existing abstraction, you may still get this tree but
; you may also get an “inverted” one. Why?


; Exercise 328:
; Copy and paste figure 120 into DrRacket; include your test suite. Validate
; the test suite. As you read along the remainder of this section, perform the
; edits and rerun the test suites to confirm the validity of our arguments.


; Exercise 329:
; How many times does a file name read! occur in the directory tree TS? Can you
; describe the path from the root directory to the occurrences? What is the
; total size of all the files in the tree? What is the total size of the
; directory if each directory node has size 1? How many levels of directories
; does it contain?


; Exercise 330:
; Translate the directory tree in figure 123 into a data representation
; according to model 1.


; Exercise 331:
; Design the function how-many, which determines how many files a given Dir.v1
; contains. Remember to follow the design recipe; exercise 330 provides you
; with data examples.


; Exercise 332:
; Translate the directory tree in figure 123 into a data representation
; according to model 2.


; Exercise 333:
; Design the function how-many, which determines how many files a given Dir.v2
; contains. Exercise 332 provides you with data examples. Compare your result
; with that of exercise 331.


; Exercise 334:
; Show how to equip a directory with two more attributes: size and readability.
; The former measures how much space the directory itself (as opposed to its
; content) consumes; the latter specifies whether anyone else besides the user
; may browse the content of the directory.


; Exercise 335:
; Translate the directory tree in figure 123 into a data representation
; according to model 3. Use "" for the content of files.


; Exercise 336:
; Design the function how-many, which determines how many files a given Dir.v3
; contains. Exercise 335 provides you with data examples. Compare your result
; with that of exercise 333.
;
; Given the complexity of the data definition, contemplate how anyone can
; design correct functions. Why are you confident that how-many produces
; correct results?


; Exercise 337:
; Use List-of to simplify the data definition Dir.v3. Then use ISL+’s
; list-processing functions from figures 95 and 96 to simplify the function
; definition(s) for the solution of exercise 336.


; Exercise 338:
; Use create-dir to turn some of your directories into ISL+ data
; representations. Then use how-many from exercise 336 to count how many files
; they contain. Why are you confident that how-many produces correct results
; for these directories?


; Exercise 339:
; Design find?. The function consumes a Dir and a file name and determines
; whether or not a file with this name occurs in the directory tree.


; Exercise 340:
; Design the function ls, which lists the names of all files and directories in
; a given Dir.


; Exercise 341:
; Design du, a function that consumes a Dir and computes the total size of all
; the files in the entire directory tree. Assume that storing a directory in a
; Dir structure costs 1 file storage unit. In the real world, a directory is
; basically a special file, and its size depends on how large its associated
; directory is.


; Exercise 342:
; Design find. The function consumes a directory d and a file name f. If (find?
; d f) is #true, find produces a path to a file with name f; otherwise it
; produces #false.
;
; Hint While it is tempting to first check whether the file name occurs in the
; directory tree, you have to do so for every single sub-directory. Hence it is
; better to combine the functionality of find? and find.
;
; Challenge The find function discovers only one of the two files named read!
; in figure 123. Design find-all, which generalizes find and produces the list
; of all paths that lead to f in d. What should find-all produce when 
; (find? d f) is #false? Is this part of the problem really a challenge
; compared to the basic problem?


; Exercise 343:
; Design the function ls-R, which lists the paths to all files contained in a
; given Dir.


; Exercise 344:
; Redesign find-all from exercise 342 using ls-R from exercise 343. This is
; design by composition, and if you solved the challenge part of exercise 342
; your new function can find directories, too.


; Exercise 345:
; Formulate a data definition for the representation of BSL expressions based
; on the structure type definitions of add and mul. Let’s use BSL-expr in
; analogy for S-expr for the new class of data.
;
; Translate the following expressions into data:
;
;   (+ 10 -10)
;
;   (+ (* 20 3) 33)
;
;   (+ (* 3.14 (* 2 3)) (* 3.14 (* -1 -9)))
;
; Interpret the following data as expressions:
;
;   (make-add -1 2)
;
;   (make-add (make-mul -2 -3) 33)
;
;   (make-mul (make-add 1 (make-mul 2 3)) 3.14)


; Exercise 346:
; Formulate a data definition for the class of values to which a representation
; of a BSL expression can evaluate.


; Exercise 347:
; Design eval-expression. The function consumes a representation of a BSL
; expression and computes its value.


; Exercise 348:
; Develop a data representation for Boolean BSL expressions constructed from
; #true, #false, and, or, and not. Then design eval-bool-expression, which
; consumes (representations of) Boolean BSL expressions and computes their
; values. What kind of values do these Boolean expressions yield?


; Exercise 349:
; Create tests for parse until DrRacket tells you that every element in the
; definitions area is covered during the test run.


; Exercise 350:
; What is unusual about the definition of this program with respect to the
; design recipe?
;
; Note One unusual aspect is that parse uses length on the list argument. Real
; parsers avoid length because it slows the functions down.


; Exercise 351:
; Design interpreter-expr. The function accepts S-expressions. If parse
; recognizes them as BSL-expr, it produces their value. Otherwise, it signals
; the same error as parse.


; Exercise 352:
; Design subst. The function consumes a BSL-var-expr ex, a Symbol x, and a
; Number v. It produces a BSL-var-expr like ex with all occurrences of x
; replaced by v.


; Exercise 353:
; Design the numeric? function. It determines whether a BSL-var-expr is also a
; BSL-expr. Here we assume that your solution to exercise 345 is the definition
; for BSL-var-expr without Symbols.


; Exercise 354:
; Design eval-variable. The checked function consumes a BSL-var-expr and
; determines its value if numeric? yields true for the input. Otherwise it
; signals an error.
;
; In general, a program defines many constants in the definitions area, and
; expressions contain more than one variable. To evaluate such expressions, we
; need a representation of the definitions area when it contains a series of
; constant definitions. For this exercise we use association lists:
;
;   ; An AL (short for association list) is [List-of Association].
;   ; An Association is a list of two items:
;   ;   (cons Symbol (cons Number '())).
;
; Make up elements of AL.
;
; Design eval-variable*. The function consumes a BSL-var-expr ex and an
; association list da. Starting from ex, it iteratively applies subst to all
; associations in da. If numeric? holds for the result, it determines its
; value; otherwise it signals the same error as eval-variable. Hint Think of
; the given BSL-var-expr as an atomic value and traverse the given association
; list instead. We provide this hint because the creation of this function
; requires a little design knowledge from Simultaneous Processing.


; Exercise 355:
; Design eval-var-lookup. This function has the same signature as 
; eval-variable*:
;
;   ; BSL-var-expr AL -> Number
;   (define (eval-var-lookup e da) ...)
;
; Instead of using substitution, the function traverses the expression in the
; manner that the design recipe for BSL-var-expr suggests. As it descends the
; expression, it “carries along” da. When it encounters a symbol x, it uses
; assq to look up the value of x in the association list. If there is no value,
; eval-var-lookup signals an error.


; Exercise 356:
; Extend the data representation of Interpreting Variables to include the
; application of a programmer-defined function. Recall that a function
; application consists of two pieces: a name and an expression. The former is
; the name of the function that is applied; the latter is the argument.
;
; Represent these expressions:
; (k (+ 1 1)), (* 5 (k (+ 1 1))), (* (i 5) (k (+ 1 1))). We refer to this newly
; defined class of data as BSL-fun-expr.


; Exercise 357:
; Design eval-definition1. The function consumes four arguments:
;
;   a BSL-fun-expr ex;
;
;   a symbol f, which represents a function name;
;
;   a symbol x, which represents the functions’s parameter; and
;
;   a BSL-fun-expr b, which represents the function’s body.
;
; It determines the value of ex. When eval-definition1 encounters an
; application of f to some argument, it
;
;   evaluates the argument,
;
;   substitutes the value of the argument for x in b; and
;
;   finally evaluates the resulting expression with eval-definition1.
;
; Here is how to express the steps as code, assuming arg is the argument of the
; function application:
;
;   (local ((define value (eval-definition1 arg f x b))
;           (define plugd (subst b x arg-value)))
;     (eval-definition1 plugd f x b))
;
; Notice that this line uses a form of recursion that has not been covered. The
; proper design of such functions is discussed in Generative Recursion.
;
; If eval-definition1 encounters a variable, it signals the same error as
; eval-variable from exercise 354. It also signals an error for function
; applications that refer to a function name other than f.
;
; Warning The use of this uncovered form of recursion introduces a new element
; into your computations: non-termination. That is, a program may run forever
; instead of delivering a result or signaling an error. If you followed the
; design recipes of the first four parts, you cannot write down such programs.
; For fun, construct an input for eval-definition1 that causes it to run
; forever. Use STOP to terminate the program.


; Exercise 358:
; Provide a structure type and a data definition for function definitions.
; Recall that such a definition has three essential attributes:
;
;   the function’s name, which is represented with a symbol;
;
;   the function’s parameter, which is also a name; and
;
;   the function’s body, which is a variable expression.
;
; We use BSL-fun-def to refer to this class of data.
;
; Use your data definition to represent these BSL function definitions:
;
;   (define (f x) (+ 3 x))
;
;   (define (g y) (f (* 2 y)))
;
;   (define (h v) (+ (f v) (g v)))
;
; Next, define the class BSL-fun-def* to represent a definitions area that
; consists of a number of one-argument function definitions. Translate the
; definitions area that defines f, g, and h into your data representation and
; name it da-fgh.
;
; Finally, work on the following wish:
;
;   ; BSL-fun-def* Symbol -> BSL-fun-def
;   ; retrieves the definition of f in da
;   ; signals an error if there is none
;   (check-expect (lookup-def da-fgh 'g) g)
;   (define (lookup-def da f) ...)
;
; Looking up a definition is needed for the evaluation of applications.


; Exercise 359:
; Design eval-function*. The function consumes ex, a BSL-fun-expr, and da, a
; BSL-fun-def* representation of a definitions area. It produces the result
; that DrRacket shows if you evaluate ex in the interactions area, assuming the
; definitions area contains da.
;
; The function works like eval-definition1 from exercise 357. For an
; application of some function f, it
;
;   evaluates the argument;
;
;   looks up the definition of f in the BSL-fun-def representation of da, which
;   comes with a parameter and a body;
;
;   substitutes the value of the argument for the function parameter in the
;   function’s body; and
;
;   evaluates the new expression via recursion.
;
; Like DrRacket, eval-function* signals an error when it encounters a variable
; or function name without definition in the definitions area.


; Exercise 360:
; Formulate a data definition for the representation of DrRacket’s definitions
; area. Concretely, the data representation should work for a sequence that
; freely mixes constant definitions and one-argument function definitions. Make
; sure you can represent the definitions area consisting of three definitions
; at the beginning of this section. We name this class of data BSL-da-all.
;
; Design the function lookup-con-def. It consumes a BSL-da-all da and a symbol
; x. It produces the representation of a constant definition whose name is x,
; if such a piece of data exists in da; otherwise the function signals an error
; saying that no such constant definition can be found.
;
; Design the function lookup-fun-def. It consumes a BSL-da-all da and a symbol
; f. It produces the representation of a function definition whose name is f,
; if such a piece of data exists in da; otherwise the function signals an error
; saying that no such function definition can be found.


; Exercise 361:
; Design eval-all. Like eval-function* from exercise 359, this function
; consumes the representation of an expression and a definitions area. It
; produces the same value that DrRacket shows if the expression is entered at
; the prompt in the interactions area and the definitions area contains the
; appropriate definitions. Hint Your eval-all function should process variables
; in the given expression like eDesign eval-all. Like eval-function* from
; exercise 359, this function consumes the representation of an expression and
; a definitions area. It produces the same value that DrRacket shows if the
; expression is entered at the prompt in the interactions area and the
; definitions area contains the appropriate definitions. Hint Your eval-all
; function should process variables in the given expression
; like eval-var-lookup in exercise 355.val-var-lookup in exercise 355.


; Exercise 362:
; It is cumbersome to enter the structure-based data representation of BSL
; expressions and a definitions area. As the end of Interpreting Expressions
; demonstrates, it is much easier to quote expressions and (lists of)
; definitions.
;
; Design a function interpreter. It consumes an S-expr and an Sl. The former is
; supposed to represent an expression and the latter a list of definitions. The
; function parses both with the appropriate parsing functions and then uses
; eval-all from exercise 361 to evaluate the expression. Hint You must adapt
; the ideas of exercise 350 to create a parser for definitions and lists of
; definitions.
;
; You should know that eval-all-sexpr makes it straightforward to check whether
; it really mimics DrRacket’s evaluator.


; Exercise 363:
; All elements of Xexpr.v2 start with a Symbol, but some are followed by a list
; of attributes and some by just a list of Xexpr.v2s. Reformulate the
; definition of Xexpr.v2 to isolate the common beginning and highlight the
; different kinds of endings.
;
; Eliminate the use of List-of from Xexpr.v2.


; Exercise 364:
; Represent this XML data as elements of Xexpr.v2:
;
;   <transition from="seen-e" to="seen-f" />
;
;   <ul><li><word /><word /></li><li><word /></li></ul>
;
; Which one could be represented in Xexpr.v0 or Xexpr.v1?


; Exercise 365:
; Interpret the following elements of Xexpr.v2 as XML data:
;
;   '(server ((name "example.org")))
;
;   '(carcas (board (grass)) (player ((name "sam"))))
;
;   '(start)
;
; Which ones are elements of Xexpr.v0 or Xexpr.v1?


; Exercise 366:
; Design xexpr-name and xexpr-content.


; Exercise 367:
; The design recipe calls for a self-reference in the template for xexpr-attr.
; Add this self-reference to the template and then explain why the finished
; parsing function does not contain it.


; Exercise 368:
; Formulate a data definition that replaces the informal “or” signature for the
; definition of the list-of-attributes? function.


; Exercise 369:
; Design find-attr. The function consumes a list of attributes and a symbol. If
; the attributes list associates the symbol with a string, the function
; retrieves this string; otherwise it returns #false.—Consider using assq to
; define the function.


; Exercise 370:
; Make up three examples for XWords. Design word?, which checks whether some
; ISL+ value is in XWord, and word-text, which extracts the value of the only
; attribute of an instance of XWord.


; Exercise 371:
; Refine the definition of Xexpr so that you can represent XML elements,
; including items in enumerations, that are plain strings.


; Exercise 372:
; Before you read on, equip the definition of render-item1 with tests. Make
; sure to formulate these tests in such a way that they don’t depend on the BT
; constant. Then explain how the function works; keep in mind that the purpose
; statement explains only what it does.


; Exercise 373:
; Figure 128 is missing test cases. Develop test cases for all the functions.


; Exercise 374:
; The data definitions in figure 127 use list. Rewrite them so they use cons.
; Then use the recipe to design the rendering functions for XEnum.v2 and
; XItem.v2 from scratch. You should come up with the same definitions as in
; figure 128.


; Exercise 375:
; The wrapping of cond with
;
;   (beside/align 'center BT ...)
;
; may surprise you. Edit the function definition so that the wrap-around
; appears once in each clause. Why are you confident that your change works?
; Which version do you prefer?


; Exercise 376:
; Design a program that counts all "hello"s in an instance of XEnum.v2.


; Exercise 377:
; Design a program that replaces all "hello"s with "bye" in an enumeration.


; Exercise 378:
; Modify the rendering function so that it overlays the name of the state onto
; the colored square.


; Exercise 379:
; Formulate test cases for find.


; Exercise 380:
; Reformulate the data definition for 1Transition so that it is possible to
; restrict transitions to certain keystrokes. Try to formulate the change so
; that find continues to work without change. What else do you need to change
; to get the complete program to work? Which part of the design recipe provides
; the answer(s)? See exercise 229 for the original exercise statement.


; Exercise 381:
; The definitions of XMachine and X1T use quote, which is highly inappropriate
; for novice program designers. Rewrite them first to use list and then cons.


; Exercise 382:
; Formulate an XML configuration for the BW machine, which switches from white
; to black and back for every key event. Translate the XML configuration into
; an XMachine representation. See exercise 227 for an implementation of the
; machine as a program.


; Exercise 383:
; Run the code in figure 130 with the BW Machine configuration from exercise
; 382.


; Exercise 384:
; Figure 133 mentions read-xexpr/web. See figure 132 for its signature and
; purpose statement and then read its documentation to determine the difference
; to its “plain” relative.
;
; Figure 133 is also missing several important pieces, in particular the
; interpretation of data and purpose statements for all the locally defined
; functions. Formulate the missing pieces so that you get to understand the
; program.


; Exercise 385:
; Look up the current stock price for your favorite company at Google’s
; financial service page. If you don’t favor a company, pick Ford. Then save
; the source code of the page as a file in your working directory. Use
; read-xexpr in DrRacket to view the source as an Xexpr.v3.


; Exercise 386:
; Here is the get function:
;
;   ; Xexpr.v3 String -> String
;   ; retrieves the value of the "content" attribute 
;   ; from a 'meta element that has attribute "itemprop"
;   ; with value s
;   (check-expect
;     (get '(meta ((content "+1") (itemprop "F"))) "F")
;     "+1")
;
;   (define (get x s)
;     (local ((define result (get-xexpr x s)))
;       (if (string? result)
;           result
;           (error "not found"))))
;
; It assumes the existence of get-xexpr, a function that searches an arbitrary
; Xexpr.v3 for the desired attribute and produces [Maybe String].
;
; Formulate test cases that look for other values than "F" and that force get
; to signal an error.
;
; Design get-xexpr. Derive functional examples for this function from those for
; get. Generalize these examples so that you are confident get-xexpr can
; traverse an arbitrary Xexpr.v3. Finally, formulate a test that uses the web
; data saved in exercise 385.


; Exercise 387:
; Design cross. The function consumes a list of symbols and a list of numbers
; and produces all possible ordered pairs of symbols and numbers. That is, when
; given '(a b c) and '(1 2), the expected result is '((a 1) (a 2) (b 1) (b 2) 
; (c 1) (c 2)).


; Exercise 388:
; In the real world, wages*.v2 consumes lists of employee structures and lists
; of work records. An employee structure contains an employee’s name, social
; security number, and pay rate. A work record also contains an employee’s name
; and the number of hours worked in a week. The result is a list of structures
; that contain the name of the employee and the weekly wage.
;
; Modify the program in this section so that it works on these realistic
; versions of data. Provide the necessary structure type definitions and data
; definitions. Use the design recipe to guide the modification process.


; Exercise 389:
; Design the zip function, which consumes a list of names, represented as
; strings, and a list of phone numbers, also strings. It combines those equally
; long lists into a list of phone records:
;
;   (define-struct phone-record [name number])
;   ; A PhoneRecord is a structure:
;   ;   (make-phone-record String String)
;
; Assume that the corresponding list items belong to the same person.


; Exercise 390:
; Design the function tree-pick. The function consumes a tree of symbols and a
; list of directions:
;
;   (define-struct branch [left right])
;
;   ; A TOS is one of:
;   ; – Symbol
;   ; – (make-branch TOS TOS)
;
;   ; A Direction is one of:
;   ; – 'left
;   ; – 'right
;
;   ; A list of Directions is also called a path. 
;
; Clearly a Direction tells the function whether to choose the left or the
; right branch in a nonsymbolic tree. What is the result of the tree-pick
; function? Don’t forget to formulate a full signature. The function signals an
; error when given a symbol and a non-empty path.


; Exercise 391:
; Design replace-eol-with using the strategy of Processing Two Lists
; Simultaneously: Case 3. Start from the tests. Simplify the result
; systematically.


; Exercise 392:
; Simplify the function tree-pick from exercise 390.


; Exercise 393:
; Figure 62 presents two data definitions for finite sets. Design the union
; function for the representation of finite sets of your choice. It consumes
; two sets and produces one that contains the elements of both.
;
; Design intersect for the same set representation. It consumes two sets and
; produces the set of exactly those elements that occur in both.


; Exercise 394:
; Design merge. The function consumes two lists of numbers, sorted in ascending
; order. It produces a single sorted list of numbers that contains all the
; numbers on both inputs lists. A number occurs in the output as many times as
; it occurs on the two input lists together.


; Exercise 395:
; Design take. It consumes a list l and a natural number n. It produces the
; first n items from l or all of l if it is too short.
;
; Design drop. It consumes a list l and a natural number n. Its result is l
; with the first n items removed or just ’() if l is too short.


; Exercise 396:
; Hangman is a well-known guessing game. One player picks a word, the other
; player gets told how many letters the word contains. The latter picks a
; letter and asks the first player whether and where this letter occurs in the
; chosen word. The game is over after an agreed-upon time or number of rounds.
;
; Figure 136 presents the essence of a time-limited version of the game. See
; Local Definitions Add Expressive Power for why checked-compare is defined
; locally.
;
; The goal of this exercise is to design compare-word, the central function. It
; consumes the word to be guessed, a word s that represents how much/little the
; guessing player has discovered, and the current guess. The function produces
; s with all "_" where the guess revealed a letter.
;
; Once you have designed the function, run the program like this:
;
;   (define LOCATION "/usr/share/dict/words") ; on OS X
;   (define AS-LIST (read-lines DICTIONARY-LOCATION))
;   (define SIZE (length DICTIONARY-AS-LIST))
;
;   (play (list-ref AS-LIST (random SIZE)) 10)
;
; See figure 74 for an explanation. Enjoy and refine as desired!


; Exercise 397:
; In a factory, employees punch time cards as they arrive in the morning and
; leave in the evening. Electronic time cards contain an employee number and
; record the number of hours worked per week. Employee records always contain
; the name of the employee, an employee number, and a pay rate.
;
; Design wages*.v3. The function consumes a list of employee records and a list
; of time-card records. It produces a list of wage records, which contain the
; name and weekly wage of an employee. The function signals an error if it
; cannot find an employee record for a time card or vice versa.
;
; Assumption There is at most one time card per employee number.


; Exercise 398:
; A linear combination is the sum of many linear terms, that is, products of
; variables and numbers. The latter are called coefficients in this context.
; Here are some examples:
;
;   5 * x         5 * x + 17 * y       5 * x + 17 * y + 3 * z
;
; In all examples, the coefficient of x is 5, that of y is 17, and the one for
; z is 3.
;
; If we are given values for variables, we can determine the value of a
; polynomial. For example, if x = 10, the value of image is 50; if x = 10 and
; y = 1, the value of image is 67; and if x = 10, y = 1, and z = 2, the value
; of image is 73.
;
; There are many different representations of linear combinations. We could,
; for example, represent them with functions. An alternative representation is
; a list of its coefficients. The above combinations would be represented as:
;
;   (list 5)
;   (list 5 17)
;   (list 5 17 3)
;
; This choice of representation assumes a fixed order of variables.
;
; Design value. The function consumes two equally long lists: a linear
; combination and a list of variable values. It produces the value of the
; combination for these values.


; Exercise 399:
; Louise, Jane, Laura, Dana, and Mary decide to run a lottery that assigns one
; gift recipient to each of them. Since Jane is a developer, they ask her to
; write a program that performs this task in an impartial manner. Of course,
; the program must not assign any of the sisters to herself.
;
; Here is the core of Jane’s program:
;
;   ; [List-of String] -> [List-of String] 
;   ; picks a random non-identity arrangement of names
;   (define (gift-pick names)
;     (random-pick
;       (non-same names (arrangements names))))
;
;   ; [List-of String] -> [List-of [List-of String]]
;   ; returns all possible permutations of names
;   ; see exercise 213
;   (define (arrangements names)
;     ...)
;
; It consumes a list of names and randomly picks one of those permutations that
; do not agree with the original list at any place.
;
; Your task is to design two auxiliary functions:
;
;   ; [NEList-of X] -> X 
;   ; returns a random item from the list 
;   (define (random-pick l)
;     (first l))
;
;   ; [List-of String] [List-of [List-of String]] 
;   ; -> 
;   ; [List-of [List-of String]]
;   ; produces the list of those lists in ll that do 
;   ; not agree with names at any place 
;   (define (non-same names ll)
;     ll)
;
; Recall that random picks a random number; see exercise 99.


; Exercise 400:
; Design the function DNAprefix. The function takes two arguments, both lists
; of 'a, 'c, 'g, and 't, symbols that occur in DNA descriptions. The first list
; is called a pattern, the second one a search string. The function returns
; #true if the pattern is identical to the initial part of the search string;
; otherwise it returns #false.
;
; Also design DNAdelta. This function is like DNAprefix but returns the first
; item in the search string beyond the pattern. If the lists are identical and
; there is no DNA letter beyond the pattern, the function signals an error. If
; the pattern does not match the beginning of the search string, it returns
; #false. The function must not traverse either of the lists more than once.
;
; Can DNAprefix or DNAdelta be simplified?


; Exercise 401:
; Design sexp=?, a function that determines whether two S-expressions are
; equal. For convenience, here is the data definition in condensed form:
;
;   ; An S-expr (S-expression) is one of: 
;   ; – Atom
;   ; – [List-of S-expr]
;   ; 
;   ; An Atom is one of: 
;   ; – Number
;   ; – String
;   ; – Symbol 
;
; Whenever you use check-expect, it uses a function like sexp=? to check
; whether the two arbitrary values are equal. If not, the check fails and
; check-expect reports it as such.


; Exercise 402:
; Reread exercise 354. Explain the reasoning behind our hint to think of the
; given expression as an atomic value at first.


; Exercise 403:
; A Spec combines one Label and one Predicate into a list. While this choice is
; perfectly acceptable for a mature programmer, it violates our guideline of
; using a structure type when the represented information consists of a fixed
; number of pieces.
;
; Here is an alternative data representation:
;
;   (define-struct spec [label predicate])
;   ; Spec is a structure: (make-spec Label Predicate)
;
; Use this alternative definition to represent the databases from figure 137.


; Exercise 404:
; Design the function andmap2. It consumes a function f from two values to
; Boolean and two equally long lists. Its result is also a Boolean.
; Specifically, it applies f to pairs of corresponding values from the two
; lists, and if f always produces #true, andmap2 produces #true, too.
; Otherwise, andmap2 produces #false. In short, andmap2 is like andmap but for
; two lists.


; Exercise 405:
; Design the function row-filter. Construct examples for row-filter from the
; examples for project.
;
; Assumption The given database passes an integrity check, meaning each row is
; as long as the schema and thus its list of names.


; Exercise 406:
; The row-project function recomputes the labels for every row of the
; database’s content. Does the result differ from function call to function
; call? If not, hoist the expression.


; Exercise 407:
; Redesign row-filter using foldr. Once you have done so, you may merge
; row-project and row-filter into a single function. Hint The foldr function in
; ISL+ may consume two lists and process them in parallel.


; Exercise 408:
; Design the function select. It consumes a database, a list of labels, and a
; predicate on rows. The result is a list of rows that satisfy the given
; predicate, projected down to the given set of labels.


; Exercise 409:
; Design reorder. The function consumes a database db and list lol of Labels.
; It produces a database like db but with its columns reordered according to
; lol. Hint Read up on list-ref.
;
; At first assume that lol consists exactly of the labels of db’s columns. Once
; you have completed the design, study what has to be changed if lol contains
; fewer labels than there are columns and strings that are not labels of a
; column in db.


; Exercise 410:
; Design the function db-union, which consumes two databases with the exact
; same schema and produces a new database with this schema and the joint
; content of both. The function must eliminate rows with the exact same
; content.
;
; Assume that the schemas agree on the predicates for each column.


; Exercise 411:
; Design join, a function that consumes two databases: db-1 and db-2. The
; schema of db-2 starts with the exact same Spec that the schema of db-1 ends
; in. The function creates a database from db-1 by replacing the last cell in
; each row with the translation of the cell in db-2.
;
; Here is an example. Take the databases in figure 137. The two satisfy the
; assumption of these exercises, that is, the last Spec in the schema of the
; first is equal to the first Spec of the second. Hence it is possible to join
; them:
;
;   Name       Age       Description
;   String     Integer   String 
;   "Alice"    35        "presence"
;   "Bob"      25        "absence"
;   "Carol"    30        "presence"
;   "Dave"     32        "absence"
;
; Its translation maps #true to "presence" and #false to "absence".
;
; Hints (1) In general, the second database may “translate” a cell to a row of
; values, not just one value. Modify the example by adding additional terms to
; the row for "presence" and "absence".
;
; (2) It may also “translate” a cell to several rows, in which case the process
; adds several rows to the new database. Here is a second example, a slightly
; different pair of databases from those in figure 137:
;
;   Name      Age     Present  Present  Description
;   String    Integer Boolean  Boolean  String
;   "Alice"   35      #true    #true    "presence"
;   "Bob"     25      #false   #true    "here"
;   "Carol"   30      #true    #false   "absence"
;   "Dave"    32      #false   #false   "there"   	
;
; Joining the left database with the one on the right yields a database with
; eight rows:
;
;   Name      Age      Description
;   String    Integer  String
;   "Alice"   35       "presence"
;   "Alice"   35       "here"
;   "Bob"     25       "absence"
;   "Bob"     25       "there"
;   "Carol"   30       "presence"
;   "Carol"   30       "here"
;   "Dave"    32       "absence"
;   "Dave"    32       "there"
;
; (3) Use iterative refinement to solve the problem. For the first iteration,
; assume that a “translation” finds only one row per cell. For the second one,
; drop the assumption.
;
; Note on Assumptions This exercise and the entire section mostly rely on
; informally stated assumptions about the given databases. Here, the design of
; join assumes that “the schema of db-2 starts with the exact same Spec that
; the schema of db-1 ends in.” In reality, database functions must be checked
; functions in the spirit of Input Errors. Designing checked-join would be
; impossible for you, however. A comparison of the last Spec in the schema of
; db-1 with the first one in db-2 calls for a comparison of functions. For
; practical solutions, see a text on databases.

