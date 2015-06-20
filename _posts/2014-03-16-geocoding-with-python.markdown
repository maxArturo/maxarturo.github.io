---
layout: post
title: Geocoding with Python
---

My girlfriend had an interesting problem for me over the weekend. She has a pretty cool job (she will tell you its rather dull) doing primary-source research for an art/production firm, and she needed to start plotting some arbitrary locations into a map. She wasn't sure yet what program she'd use to do this, but we arrived at the conclusion that having a list of lat/long's would help her no matter what program she ended up using.

For those like me that had no idea, **Geocoding** is the process of taking natural-language location descriptions and matching them to their corresponding latitude and longitude. <!-- more --> Google has an outstanding (and free!) API to get up to 2500 geocodings per day using its well-curated source of locations. The API usage is [clearly documented](https://developers.google.com/maps/documentation/geocoding/), as is tradition for Google, so it was a matter of quickly coding something up quick so that the GF could go on her merry way.

The script ought to be straightforward:

1. read some input file
2. iterate over the list, calling the Google Maps API for each location and write the output to a file
3. Profit

Though I am a VBS man at heart, I wanted to do something different. In the spirit of owning my own progress as a programmer I've decided to not use VBS or any other language I'm comfortable with going forward, which is very refreshing. Python's legendary breadth of modules to do [pretty much anything](https://www.python.org/doc/humor/#shooting-yourself-in-the-foot) is well known, and having done some Django before pushed me to go with it.

What an amazing experience! Everything just *works*. In the process of writing up the script, I learned about setting up Virtualenv, generating the packaging install scripts, the top-notch [requests module](http://docs.python-requests.org/en/latest/) and working wtih JSON to extract the data I needed. I really didn't think it would be this easy to interact with the different modules and goodies that Python includes by default. One part in specific that blew me away was the included `cmd` module to generate your very-own CLI for your program, just by *documenting your methods*. For example,

{% highlight python %}
def do_quit(self, args):
	"""Quits the program"""
	print "Quitting."
	raise SystemExit
{% endhighlight %}

defines an argument within your CLI right after the method name `do_`. The help verbiage is the doc for the method, and the implemented superclass takes care of the looping.

*Brilliant*.

No wonder everyone is going crazy about Python! I'm very happy I ran into this just by having to make this rather simple script and it goes to show just how much more there is to learn. The script worked out and the GF was able to use it (granted I probably didn't need to add a CLI, but hey!!) and got brownie points for it. Not brownies, though. We're working on that.

If you're interested in the script it's [here](https://github.com/maxArturo/gMapsGeoCoder/blob/master/geocoder.py), as well as on my github account on the side of the page. There are some silly assumptions about quotes as I was taking in Excel-formatted CSV files and such, but you could probably modify it and make it inifinitely better if you wanted to. Yes, I know there are wrappers for Google's API but – that would take out the fun!

*-Max*
