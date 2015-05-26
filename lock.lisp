(uiop:define-package bytecurry.hash/lock
  (:nicknames :hash-table-lock :bhash/lock)
  (:use :cl)
  #+sbcl
  (:import-from :sb-ext #:with-locked-hash-table)
  #-(or sbcl lispworks)
  (:import-from :serapeum #:synchronized)
  (:export #:with-locked-hash-table))

(in-package :bytecurry.hash/lock)

#+lispworks
(defmacro with-locked-hash-table ((table) &body body)
  "Alias for WITH-HASH-TABLE-LOCKED"
  `(hcl:with-hash-table-locked ,table ,@body))

#-(or sbcl lispworks)
(defmacro with-locked-hash-table ((table) &body body)
  "Execute BODY with a lock on TABLE."
  `(synchronized (,table)
     ,@body))
