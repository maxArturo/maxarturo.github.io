---
title: Jumpstarting into Phile
subtitle: 
date: 2014 Mar 04
author: Max A
---

<section>
Back in the day (slowly I feel more attributed to use that phrase), I messed with PHP and MySQL to produce a passable webpage, but alas – with the passage of time, the domain along with the content has been claimed by Oblivion. It seems that everyone is running amock these days with node.js and Django - where was my own shiny webpage?

</section>

## Enter [Phile](https://github.com/PhileCMS/Phile) ##

 It is a flat CMS - that means there is no database behind it (though I think there is a sqlite DB hidden somewhere, but I shall dive deeper). It uses a clever layout of PHP that enables you to create `.md` files and have them appear as content in your webpage. That's it - no messy uploading or indexing. You wouldn't even need a navigation page if you wanted, as the files are linked into your page automagically.

Phile is forked off of Pico CMS, the daddy behind the concept - but it seems to have enough quirks for people to move into an OO layout of the functions and resources and I must say, it is a pleasure to use.

Take me, for instance - I am mainly a VBscript guy in my day to day affairs. I am usually time-constrained so I like to be very careful what project I jump into. Knowing that I wanted to kick a site into life, I was about to go with one of the mainstream CMS's (cough, *django*), yet the flat-file philosophy really captured me. I used to be one of those guys in college that exclusively browsed the web with [eLinks](http://elinks.or.cz/) and thoroughly enjoyed XFCE on a 486, so that would fall in line.

Within minutes (and within days of finding a quaint little hosting service that had *mod_rewrite* activated) I was up and running. It gently exposed me to Twig and rekindled the PHP interest in me, just so I can contribute back. Feel free to check out the GitHub repo, the [summary of features](http://philecms.github.io/Phile/) and also James Doyle's shindig. He seems like a smart man.

<section>

</section>

> <span class="newthought">Editor's note.</span> You may see that this webpage is actually hosted in [Octopress](octopress.org), a Jekyll blogging implementation with lots of handy settings in SASS and yml configurations that I recommend you check out. In the effort of looking for the most 'static' CMS system (if you can name Octopress one, it's more of an advanced HTML/CSS/JS rolling engine) I was won over by its advanced configuration settings and an introduction to Ruby at the same time.[^1] I still fully recomend Phile and encourage you to help James out if PHP is close to heart.

[^1]: *see [this post](./2019-05-05-multi-year-reboot.html) for updates.*
