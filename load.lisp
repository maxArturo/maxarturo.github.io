; used to quickly make sure everything is loaded and tested
; before you start developing

(load "~/quicklisp/setup.lisp")
(ql:quickload "cl-interpol")
(ql:quickload "spinneret")
(ql:quickload "cl-markdown")
(ql:quickload "spinneret/cl-markdown")
(ql:quickload "local-time")
(ql:quickload "fiveam")
(interpol:enable-interpol-syntax)

(load #p"cl-web-churner.asd")
(asdf:make "cl-web-churner")
(asdf:load-system "cl-web-churner" :force t)


