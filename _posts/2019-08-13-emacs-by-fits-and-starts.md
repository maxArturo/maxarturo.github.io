---
layout: post
title: emacs, by fits and starts
---

I think this is a ritual that most Vim users will understand. At some point in your Vim journey, one peeks over the "dark side" and sees what the emacs crowd have to offer. I've looked at emacs a handful of times over the years - academically only, mind you - and several times came to the same conclusion: emacs users are crazy! Look at all those chords of commands! They make no sense! 

And yet, I kept seeing hints of its _true power_ sprinkled around the web. Musings about an obscure [org mode](https://orgmode.org/) that's so powerful you could run a business with it (and [some people do](https://bofh.org.uk/2019/02/25/baking-with-emacs/)), being able to draw, edit full functions, and other selling points made me dig around a little bit more. And as if destiny conspired to emacs me, I found a project called [spacemacs](http://spacemacs.org/) that promised the best of both worlds: vim keybindings and access to the emacs ecosystem. I put aside 30 minutes and took the plunge.

By my reckoning, it's been about a month since. So now, you figure, I am an emacs monk who has been [hit over the head and attained enlightenment](http://wiki.c2.com/?ZenSlap)? Not quite so. However, I did get a taste of the emacs universe and I gotta say, I was missing out. 

The venerable org mode is, in my opinion, a beautiful excess of features for hyper-organized people. However, its text-based simplicity is very powerful and I've come to rely on it heavily. I followed in the path of other [fellow developers](https://meta.caspershire.net/spacemacs-and-org-mode/) who have jumped into org mode and I've found it an easy and pleasant experience - to the point that it's swallowed up my entire productivity workflow. I mean, [pomodoro mode](http://develop.spacemacs.org/layers/+emacs/org/README.html#pomodoro)? How cool is that!

In no particular order, I find these features of most benefit: 

* Folding of arbitrary sections of code. You can fold any text below a section (org mode calls it an outline) by hitting `tab`.

Folded: 

```
* Personal...
```

Unfolded: 

```
* Personal
** Emacs...
** Kubernetes...
```

* Tables

Tables get auto-formatted and are very easy to type. You can also convert them into full-fledged spreadsheets by adding elisp functions inside of them, if you are so motivated. 

* Deadlines, tags

Yup. All text-based. 

* Git

Magit is one of the most sensible text-based git interfaces, and it's just another layer in emacs. However, the UI is not super intuitive and some [additional help](https://www.saltycrane.com/blog/2018/11/magit-spacemacs-evil-magit-notes/) is recommended to learn the ropes. Very much worth it.

Now I don't even think of it twice before opening a buffer and typing out emails, reviewing code, etc., all via spacemacs. Will I ever go "raw" emacs? Probably not. After taking a bite from the fruit of wisdom, I've concluded that vim key navigation is still vastly superior to the web of key chords needed to become productive in emacs. Much like Esperanto, I'm sure you can get by with it if you learn it from an earlier age. But at this point I unfortunately have devoted too much muscle memory to Vim and have painted myself into a corner. 


