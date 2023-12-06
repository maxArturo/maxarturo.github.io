;;;; funcitonality used for html generation 
;;;; and dom node representation

(in-package #:generator)

(defmacro md-html (str)
  `(with-html-string (,(substitute  #\U+00B1 #\~ str))))

(defmacro render-page (file)
  (let* ((raw-page (uiop:read-file-form file))
         (kind (getf raw-page :kind)))
    (cond 
      ((eql kind :post) 
       `(with-post ,raw-page))
      ((eql kind :landing) 
       `(with-landing ,raw-page))
      (t (error "unimplemented kind of page")))))

(defun default-output-path (file)
  (let
    ((dir-path (pathname-directory file)))
    (make-pathname 
      :directory 
      (append '(:relative "docs")
              (cddr dir-path))
      :type "html"
      :defaults
      file)))

(defmacro write-file 
  (file &optional (output-path))
  `(with-open-file 
     (output 
       (ensure-directories-exist 
         (or ,output-path 
             (default-output-path ,file)))
       :direction :output 
       :if-exists :supersede
       :if-does-not-exist :create)
     (format output (render-page ,file))))
#+nil
(uiop:read-file-form #P"website/index.md")
(write-file #P"website/index.md")

(defmacro render-site ()
  (let* ((filenames 
           (mapcar (lambda (f) ( enough-namestring f (uiop:getcwd))) 
                   (directory #p"website/**/*.md")))
         (directives (mapcar (lambda (f) `(write-file ,f)) filenames)))
    `(progn ,@directives)))
(render-site)

