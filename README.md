# [my humble Web Site](https://maxalcala.com)

> *say why are you building yet another static site generator?*
>
> everyone

This is my blog. It's gone through yet another refactor, whittling it down to its barest essence. This involves removing most executable code and reverting to the bedrock foundation of hypertext documents, [pandoc](https://pandoc.org/).

I've leaned heavily on [tufte-pandoc-css](https://github.com/jez/tufte-pandoc-css/tree/master), fixing the `makefile` and making sure that all the produced `html` was self-contained via `pandoc`.

Other than that, it's just a `makefile` all the way down.

## what does what

- [`tufte-css`](https://edwardtufte.github.io/tufte-css/) provides a simple, concise layout
- `tufte-pandoc-css` adds flexible sidenotes and markdown ease-of-use
- `pandoc` integrates all the css and renders static bundled HTML

Pandoc metadata provides the wiring for article and other post data, e.g.

```text
---
title: A Sample Title
subtitle: Sampling it
date: 2019 Aug 13
author: Max A
---

```

## Usage

`make` will `rm` and then create HTML files in the `docs` folder, ready for serving by GH pages. Check out the `makefile` for more details.
