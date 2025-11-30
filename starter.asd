(in-package #:asdf-user)

(defsystem :starter
  :version "0.1.0"
  :author "Your Name"
  :license "MIT"
  :description "Minimal Common Lisp starter project"
  :long-description "A tiny Common Lisp \"hello world\" you can fork and extend."
  :build-operation program-op
  :build-pathname "starter"
  :entry-point "starter:main"
  :serial t
  :components ((:file "src/package")
               (:file "src/main")))

