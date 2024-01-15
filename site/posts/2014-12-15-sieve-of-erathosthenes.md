---
title: Sieve of Eratosthenes
subtitle: 
date: 2014-12-02 09:36:03 -0600
author: Max A
---

<section>

There's a lot of humility that goes with learning (or re-learning) topics in CS/Discrete math. I had one such instance a couple of days ago as I started reviewing my basic data structures and algorithms, and realized I remembered way less than I thought.

Now mind you, it's been roughly 4 years since I've taken an Algorithms course, and some people would say that its even worse to start out with no prior knowledge than with some vague notion. To those people, I'll argue back that despite some truth to their claim, it's nonetheless frustrating to stare back at a relatively simple algorithm *you knew you had down not too many years ago, it seems* and not really be able to grasp it.

That just happened with me this weekend with Eratosthenes. The [wikipedia article](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) does a very thorough job of explaining what it does - find prime numbers iteratively -, but what I really wanted to understand was the reasons for optimizations (which is is just hand-waved away in the first page of google links). See, I have that need always to understand assumptions and abstractions - and it becomes an unhealthy obsession until I can solve it. It was not until I found [this wikibooks page](https://en.wikibooks.org/wiki/Discrete_Mathematics/Sieve_of_Eratosthenes) that actually went into the property of composite numbers and the reason for starting at n^2 for sieving that I got that sweet *aaahhh* moment of understanding.

<!-- more -->

After that I coded up a reasonably fast [implementation for ruby](https://github.com/maxArturo/programmerDaily/blob/master/unsorted/sieve_of_erathostenes.rb) and almost considered myself done. However, I did remain a bit frustrated by how long it took me to grasp the concept, and considered for a moment how I could both cement the knowledge and make something useful at the same time. Using the trusty old d3.js, I whipped up a [visualization](http://bl.ocks.org/maxArturo/1e3abba3ddcc66017e99)[^ednote] that hopefully aids those of us who are more visual.

[^ednote]:
    *Editors note*. This resource, too, has fallen to code rot as of 2024. This particularly makes me sad since Mike Bostock's leadership and work was very formative for my coding career. Now you just get a hardlink back to a gist - which I guess is good for a fallback, but I can't help to feel that these neat little tools that were emblematic for the "show and tell" spirit of the open web are one by one falling by the wayside. The author will instead celebrate the fact that Mike seems to be doing great over at [Observable](https://observablehq.com/plot/).

It definitely feels good to go through the cycle of mis(no)understanding -> search -> understand -> implement -> create something new. I'm looking forward to do the same with a bunch of my old discrete math algorithms!

</section>