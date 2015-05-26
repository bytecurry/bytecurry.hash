;;;; bytecurry.hash.asd
;;;; Copyright (c) 2015 Thayne McCombs <astrothayne@gmail.com>
;;;; MIT license
(in-package :asdf-user)

(defsystem #:bytecurry.hash
  :description "Utilities and helpers for working with hash tables"
  :author "Thayne McCombs <bytecurry.software@gmail.com>"
  :version "1.0.0"
  :license "MIT"
  :defsystem-depends-on (:asdf-package-system :bytecurry.asdf-ext)
  :class :package-inferred-system
  :depends-on (:bytecurry.hash/interface)
  :components ((:atdoc-html "docs"
                            :packages :bytecurry.hash/interface
                            :single-page-p t
                            :css :blue-serif)))


(register-system-packages "named-readtables" :named-readtables)
(register-system-packages "bytecurry.hash/lock" :bhash/lock)
(register-system-packages "bytecurry.hash/syntax" :bhash/syntax)
