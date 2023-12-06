(in-package #:common-lisp-user)

(uiop:define-package 
  #:generator
  (:use #:cl #:cl-interpol #:spinneret/cl-markdown #:local-time)
  (:import-from #:local-time
   #:timestamp-year
   #:now)
  (:import-from #:spinneret 
   #:with-html-string
   #:with-html)
  (:export #:generate))

(uiop:define-package 
  #:cl-web-churner
  (:use #:cl #:fiveam)
  (:import-from #:generator
   #:generate)
  (:export 
    #:cl-web-churner-suite
    #:generate))
