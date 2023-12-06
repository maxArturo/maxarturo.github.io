# cl-web-churner

> *say why are you building yet another static site generator?*

This is a common lisp HTML generator, made primarily as a statement of not wanting to touch yet another build/compiler libary and/or having to relearn some other abstraction on top of a simple static site generator. It relies heavily on spinneret to generate the actual HTML and cl-markdown as a side dependency to make my life easier. 

Other than that, it's just eval/print all the way down.

## what does what
- spinneret takes care of turning s-exprs into HTML5
- cl-markdown lets me write in md (vs everything being a lisp string)
- cl-interpol lets me do both of the above in a sane manner, as well as exposing the full power of lisp within markdown (!). Consider: 

```lisp
(let* ((some-whacky-val (perform-a-computation)
(post (:title "wacky title"
  :sub-title "heyoo"
  :date "2095 Jan 99"
  :kind :post
  :text #?|

  ## lookie here! Markdown!

  and my wacky value is: ${some-whacky-val}, tada!

|)))

```

The above just needs to get `eval`'d in a context where `perform-a-computation` is syntactically valid, and voila. 

The `#?|` syntax is courtesy of `cl-interpol`. The remainder is just writing your styles and file reading/writing. I must say I'm very happy with the output.


