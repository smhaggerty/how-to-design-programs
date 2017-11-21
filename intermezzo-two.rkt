; Exercise 231:
; Eliminate quote in favor of list from these expressions:
;
;   '(1 "a" 2 #false 3 "c")
;
;   '()
;
;   and this table-like shape:
;
;       '(("alan" 1000)
;         ("barb" 2000)
;         ("carl" 1500))
;
; Now eliminate list in favor of cons where needed.


; Exercise 232:
; Eliminate quasiquote and unquote from the following expressions so that they
; are written with list instead:
;
;   `(1 "a" 2 #false 3 "c")
;
;   this table-like shape:
;
;       `(("alan" ,(* 2 500))
;         ("barb" 2000)
;         (,(string-append "carl" " , the great") 1500)
;         ("dawn" 2300))
;
;   and this second web page:
;
;       `(html
;          (head
;            (title ,title))
;          (body
;            (h1 ,title)
;            (p "A second web page")))
;
;   where (define title "ratings").
;
; Also write down the nested lists that the expressions produce.


; Exercise 233:
; Develop alternatives to the following expressions that use only list and
; produce the same values:
;
;   `(0 ,@'(1 2 3) 4)
;
;   this table-like shape:
;
;       `(("alan" ,(* 2 500))
;         ("barb" 2000)
;         (,@'("carl" " , the great")   1500)
;         ("dawn" 2300))
;
;   and this third web page:
;
;       `(html
;          (body
;            (table ((border "1"))
;              (tr ((width "200"))
;                ,@(make-row '( 1  2)))
;              (tr ((width "200"))
;                ,@(make-row '(99 65))))))
;
;   where make-row is the function from above.
;
; Use check-expect to check your work.


; Exercise 234:
; Create the function make-ranking, which consumes a list of ranked song titles
; and produces a list representation of an HTML table. Consider this example:
;
;   (define one-list
;     '("Asia: Heat of the Moment"
;       "U2: One"
;       "The White Stripes: Seven Nation Army"))
;
; If you apply make-ranking to one-list and display the resulting web page in a
; browser, you see something like the screen shot in figure 85.
;
; Hint Although you could design a function that determines the rankings from a
; list of strings, we wish you to focus on the creation of tables instead. Thus
; we supply the following functions:
;
;   (define (ranking los)
;     (reverse (add-ranks (reverse los))))
;    
;   (define (add-ranks los)
;     (cond
;       [(empty? los) '()]
;       [else (cons (list (length los) (first los))
;                   (add-ranks (rest los)))]))
;
; Before you use these functions, equip them with signatures and purpose
; statements. Then explore their workings with interactions in DrRacket.
; Accumulators expands the design recipe with a way to create simpler functions
; for computing rankings than ranking and add-ranks.