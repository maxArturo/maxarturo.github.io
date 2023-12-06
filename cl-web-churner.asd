(asdf:defsystem cl-web-churner
  :name "cl-web-churner"
  :version "0.1"
  :serial t
  :author "Max Alcala <maxarturo@gmail.com>"
  :maintainer "Max Alcala <maxarturo@gmail.com>"
  :license "MIT"
  :description "html static site generator in common lisp"
  :encoding :utf-8
  :depends-on ("cl-interpol" "spinneret" "cl-markdown" "local-time" "fiveam")
  :pathname "src/"
  :components
  ((:file "package")
   (:file "test-suites")
   (:module "generator"
    :components
    (
     (:file "generator")
     (:file "layouts")
     ))))
