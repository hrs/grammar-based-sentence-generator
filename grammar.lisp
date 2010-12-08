;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; File: grammar.gram
; Author: Harry Schwartz
; Date: Nov. 2, 2007

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The grammar is defined here.
; Each entry in the following list is itself a list,
; of the form:
; (<expression to be replaced> (<possible expressions that can replace it>) )
;
; For example, in the grammar below, a NP (that's a noun phrase)
; can be replaced by (ART NOUN), (ART ADJ NOUN), or (PN).  Each term in
; these lists will itself be replaced until we hit an item that *isn't*
; a list.  When PREP is replaced by "across", for example, that's the end.
;
; This is a pretty simple grammar.  It has a limited vocabulary and
; doesn't always generate truly grammatical sentences.

(("S" (("NP" "VP")))
 ("NP" (("ART" "NOUN")
	("ART" "ADJ" "NOUN")
	("PN")))
 ("VP" (("VERB" "NP")
	("VERB" "PREP" "NP")))

 ("PN" ("Scott" "Paul" "Daniel"))
 ("ART" ("a" "the")) 
 ("VERB"  ("smiles" "splashes" "explodes" "pops" "crunches" "sneezes" "vomits" "winks" "rings" "booms" "is" "becomes" "seems" "feels" "tastes" "smells" "looks" "appears" "spills"))
 ("NOUN" ("monster" "restaurant" "pizza" "car" "dog" "fox" "waiter" "sandwich" "chair" "arena" "country" "fire-fighter" "monastery" "ape" "buffoon"))
 ("ADJ" ("colorless" "fuzzy" "green" "fat" "warm" "big" "delicious" "brown" "quick" "lazy"))
 ("PREP" ("about" "above" "across" "after" "against" "along" "among" "around" "as" "at" "before" "behind" "below" "beneath" "beside" "between" "beyond" "by" "concerning" "despite" "down" "during" "except" "excepting" "for" "from" "in" "inside" "into" "like" "near" "next to" "of" "off" "on" "onto" "out" "outside" "over" "past" "regarding" "round" "since" "through" "throughout" "till" "to" "toward" "under" "underneath" "unlike" "until" "up" "upon" "with" "within" "without")))
