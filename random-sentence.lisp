;;; Author: Harry Schwartz
;;; Last Edited: Dec. 1, 2008

;;; Formatting functions:

(defun flatten (lst)
  "Returns a simple list given a list of lists."
  (cond
    ((null lst) '())
    ((listp (car lst)) (append (flatten (car lst)) (flatten (cdr lst))))
    (t (cons (car lst) (flatten (cdr lst))))))

(defun clean-string-tree (lst)
  "Formats the sentence tree nicely by flattening, capitalizing, and punctuating it."
  (string-capitalize (format nil "~{~A~^ ~}." (flatten lst)) :end 1))

;;; Actual productive stuff:

(defun random-elt (lst)
  "Returns a random element in the list."
  (nth (random (length lst)) lst))

(defun replace-pos (pos replace-table)
  "Replaces pos with a random element from replace-table."
  (dolist (pair replace-table nil)
    (when (equal (car pair) pos)
      (let ((word (random-elt (cadr pair))))
;;	(format t "~&Replacing ~S with ~S." pos word)  ; this is for debugging.
	(return word)))))

(defun derive (sent replace-table)
  "Given a seed string (generally 'S') and a table of replacements, this function exhausts all possible replacements."
  (if (listp sent)
      (mapcar #'(lambda (s) (derive s replace-table)) sent)
      (let ((result (replace-pos sent replace-table)))
	(if result
	    (derive result replace-table)
	    sent))))

(defun sentence (gram-file)
  "Takes the name of a grammar file and creates a sentence."
  (with-open-file (stream gram-file)
    (let ((replace-table (read stream)))
      (clean-string-tree (derive "S" replace-table)))))
