---
layout: post
title: Setting up code blocks in org mode
---

Usually when taking notes, I like inserting code snippets to refer to commmands or neat ways of solving things. For those familiar with markdown this is ubiquitous with using backticks (`` ` ``) for in-line snippets, and triple ticks (```) to start and end an entire code block.

Now that I'm using org mode with spacemacs to take these notes, often I find myself exporting to github-flavored markdown with the export functionality provided by `markdown-toc` `markdown-mode` in org mode. However, org mode has a bit more complicated way of denoting code blocks. If you want a typescript code block you'll have to type up the following:

    #+begin_src typescript // this guy
    () => {console.log('hey');}
    #+end_src // and this guy

It's not a lot of characters but its more tedious than the markdown version. After perusing the internet, the module [org-tempo](https://orgmode.org/manual/Structure-Templates.html) provides not just code blocks but a smattering of annotations. In terms of spacemacs, now all you need to type in is `<s` and you'll get the code block tags inserted for you. Nice!

Now yes, it's _emacs_; you could do this with one or two lisp functions and be done. For those of us who would rather just get a module, here's how you would do it in your `.spacemacs` file:

- first, get a list of all your org-mode modules (via `SPC h d v`)
- append `org-tempo` to the list under `custom-set-variables`:

```
'(org-modules
   (quote
    (org-w3m org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-eww org-tempo)))
                                                                                                  ^^^
```
