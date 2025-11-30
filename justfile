LISP := "sbcl"

build:
  {{LISP}} --eval '(load "starter.asd")' \
           --eval '(ql:quickload :starter)' \
           --eval '(asdf:make :starter)' \
           --eval '(quit)'

run:
  ./starter
