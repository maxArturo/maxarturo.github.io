;;;; layout macros for each kind of page and section

(in-package #:generator)

(defmacro md-html (str)
  `(with-html-string (,(substitute  #\U+00B1 #\~ str))))

(defmacro with-foundation ((&key title ) &body body)
  `(with-html-string
     (:doctype)
     (:html
       (:head
         (:link :rel "stylesheet" 
          :href "https://unpkg.com/tachyons/css/tachyons.min.css")
         (:style 
           (:raw "code {
                  background-color: gray;
                  color: white;
                  }"))
         (:meta :name "viewport" :content "width=device-width, initial-scale=1.0")
         (:title ,title))
       (:body :class "athelas pa3 pa5-l pa5-m" 
        ,@body 
        (:footer :class "pv4 ph3 ph5-m ph6-l mid-gray"
         (:span :class "f3 db tc" "(C) AD" (timestamp-year (now))))))))

(defmacro code (&body body)
  `(with-html (:code :class "bg-black-20" ,@body)))

(defmacro with-post (body) 
  (destructuring-bind (&key title sub-title date text &allow-other-keys) body
    `(with-foundation
       (:title ,title) 
       (:header 
         (:h1 
           (:a :class "link dim black b db mb3 mb4-ns"
            :href "../index.html" :title "M2AS" "M2AS")))
       (:article :class "cf pt3"
        (:header :class "fn fl-l w-50-l pr4-l pb4"
         (:h1 :class "f2 lh-title fw9 mb3 mt0 pt3 bt bw2" ,title)
         (:h2 :class "f3 mid-gray lh-title" ,sub-title)
         (:time :class "f3 ttu tracked gray" ,date))
        (:div :class "fn fl-l w-50-l bt bw1 bn-l"
         (:div :class "f4 lh-copy measure" 
          (:raw (md-html, text))))))))

(defmacro with-landing (body) 
  (destructuring-bind (&key title text &allow-other-keys) body
    `(with-foundation
       (:title ,title) 
       (:nav :class "pa3 pa4-ns"
        (:a :class "link dim black b f1 f-headline-ns tc db mb3 mb4-ns"
         :href "index.html" :title "M2AS" "M2AS"))
       (:div :class "center tc f4 lh-copy measure"
        (:raw (md-html ,text))
        (:div :class "bt bw2"
         (:h2 :class "ttu tc" "links")
         (:div :class "pb4 lh-copy"
          (post-links)))))))

(defmacro post-links ()
  (let* 
    ((file-handles (uiop:directory-files #p"website/posts/"))
     (post-data 
       (sort 
         (mapcar 
           (lambda (f) 
             (list :location f 
                   :title 
                   (getf (uiop:read-file-form f) :title)
                   :date
                   (getf (uiop:read-file-form f) :date))) 
           file-handles) 
         #'string> :key (lambda (el) (getf el :date))))
     (links 
       (mapcar 
         (lambda (f) 
           (list :a 
                 :class 
                 "f4 fw7 db tc pa2 no-underline bg-animate bg-white hover-bg-light-blue black"
                 :href (format nil "posts/~a.html" (pathname-name (getf f :location)))
                 (getf f :title))) post-data)))
    `(with-html (:div :class "pa2 lh-copy"
                 ,@links))))

