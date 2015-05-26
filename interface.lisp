;;;; interface.lisp
;;;;
;;;; Copyright (c) 2015 Thayne McCombs <astrothayne@gmail.com>
;;;;
;;;; Interface for all of bytecurry.hash
;;;;
(uiop:define-package bytecurry.hash/interface
  (:nicknames :bhash :bytecurry.hash)
  (:use-reexport
   :bytecurry.hash/lock
   :bytecurry.hash/syntax))
