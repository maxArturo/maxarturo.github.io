---
title: Working with file uploads on IE9 and Rails < 4
subtitle: 
date: 2015-09-10
author: Max A
---

<section>

I am trying to get back into the swing of documenting my findings as I wrestle with tough bugs and issues. Often times I just plough on with the solution but don't bother to reflect on how I got to it, and it's a valuable excercise to train one's train of thought. In other words, **warning**: You are about to head into a rant of rabbit holes and sad IE exceptions.

[Click here to just get to the solution I found.](#solution)

Sadly though, some stories don't end up with a happy closure. There are times where one must lick one's wounds and surrender to a completely different solution than what one expected. Let me explain the quandary.

I'm working on a Rails 3 app which, among many other things, uploads files. A very simple operation that rails out of the box supports using its `ujs`, but you can certainly switch over to jquery's fine [file upload](https://github.com/blueimp/jQuery-File-Upload) plugin to gain access to drag-drop, and all sorts of other goodies. All is fine until we test in the *only* browser the client seems to like - [good old IE9](http://youtu.be/vTTzwJsHpU8).

Turns out that [ie9 doesn't support XMLHttpRequest](http://stackoverflow.com/a/13497736/2785476), but the workaround is to submit an `iFrame` with the contents of our request. And in order to do that, one needs the ability to add hooks to jquery's `ajax`, which happens starting v1.5 (or perhaps write the entire `iFrame` code).

For reasons unknown, this particular project uses an archaic version of [JavaScriptMVC](http://www.javascriptmvc.com/) that wasn't fully integrated as its creators intended - and refactoring into something more common or even the newest version is out of the question for the time being. The included version for jquery was 1.4 (and there was no clear guidelines on upgrading portions individually), so I hacked through jquery versions until the remaining JMVC code didn't complain (1.4 -> 1.6 gains you ajax hooks on Jquery and a bunch of bug fixes, which were needed for the [iframe transport](https://cmlenz.github.io/jquery-iframe-transport/)  included in `fileupload` plugin.

Once that was set up, I ran into [older IE9 implementations not supporting Array.indexOf](https://stackoverflow.com/questions/1744310/how-to-fix-array-indexof-in-javascript-for-internet-explorer-browsers). That was finally fixed with a shim that gets included directly into the code, and at this point we're ready to continue.

If you read this far down, your head must be hurting as much as mine. Brace yourself - we keep on going!

This brought me into diving into `jquery-ujs` and how it was being used in the site. I spent too much time reading into it (but leanred a bunch on the actual implementation), only to come back to the crux of the matter: with some form changes (namely, adding a `submit` input) I was finally sending the file to Rails, yet `fileuploader` was not handling the response correctly.

I've tried every use-case, scoured the SO seas and spent a couple of days in the wonderful world of frontend exceptions and IE-specific woes. And at this point, I've reached too far in. Time to back out and [actually throw a question out to the internet](https://stackoverflow.com/questions/32511830/rails-3-ie9-jquery-fileupload-no-callbacks-are-triggered).

## How it All Actually Ended Up

<a name="solution"></a>

A coworker introduced me to [Plupload](http://www.plupload.com/), which was created in a previous era of aggressive browsers and little to no standarization. We have an app with older code that actually works with that, so I'm probably going to take that code and continue on with my life. Sometimes you have to take your learnings and move on.

I wonder how that applies to the rest of one's life experience...

</section>
