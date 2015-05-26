;;;; syntax.lisp
;;;;
;;;; Copyright (c) 2015 Thayne McCombs <astrothayne@gmail.com>
;;;;
;;;; Syntax for hash tables
;;;;
(uiop:define-package bytecurry.hash/syntax
  (:nicknames :bhash/syntax :hash-table-syntax)
  (:use :cl :named-readtables)
  (:import-from :alexandria
                #:hash-table-plist
                #:plist-hash-table)
  (:export #:*print-hash-tables*
           #:print-hash-table
           #:with-readable-hash-tables
           #:hash-table-reader
           #:hash-readtable))

(in-package :bytecurry.hash/syntax)

(defparameter *print-hash-tables* nil
  "Boolean indicating whether or not to print the hash table using the
syntax of the hash table reader.")

(defun print-hash-table (table &optional (stream *standard-output*))
  "Print a hashtable in a readble way.
It can be read back in with hash-table-reader."
  (write-string "#H'" stream)
  (write (hash-table-plist table) :stream stream)
  table)

(defun hash-table-reader (stream sub-char numarg)
  "Reader macro function for reading a literal hash table.
If the first character after the sub-char is a #\', then treat it as a literal,
and create teh hash-table at read-time."
  (declare (ignore sub-char numarg))
  (let ((props (read stream t nil t)))
    (if (eq (first props) 'quote)
        (plist-hash-table (second props))
        `(plist-hash-table (list ,@props)))))

(defmethod print-object :around ((table hash-table) stream)
  "Override printing hash object, to use *print-hash-tables* to
decide if it should be printed using print-hash-table."
  (declare (stream stream))
  (if *print-hash-tables*
      (print-hash-table table stream)
      (call-next-method)))

(defmacro with-readable-hash-tables (&body body)
  "Execute BODY with *print-hash-tables* set to T."
  `(let ((*print-hash-tables* t))
    ,@body))

(defreadtable hash-readtable
  (:merge :standard)
  (:dispatch-macro-char #\# #\H #'hash-table-reader))
