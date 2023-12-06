(in-package #:common-lisp-user)

(uiop:define-package 
  #:generator
  (:use #:cl #:cl-interpol #:local-time)
  (:import-from #:local-time
   #:timestamp-year
   #:now)
  (:import-from #:spinneret 
   #:with-html-string
   #:with-html)
  (:export #:render-site))

(uiop:define-package 
  #:cl-web-churner
  (:use #:cl #:fiveam)
  (:import-from #:generator
   #:generate)
  (:export 
    #:cl-web-churner-suite
    #:generate))
