(:title "Every developer needs to be infosec-literate"
  :sub-title ""
  :date "2016-03-31"
  :kind :post
  :text #?|

I'm writing this blog post after a momentous break from typing out half-assed thoughts and spending more time with work and family errands. There's been copious travel and a lot of learnings worth sharing, but for no other reason than my indolence have I not broken out the Jekyll and updated my blog. So if you were hanging from your fingernails waiting for another riveting update of mine, you would have done well to [email](mailto:maxarturo@gmail.com) me instead and spur me into being less of a sloth. 

You see, it's very hip to be conversant about security with FBI v. Apple on the news, and information security is certainly becoming a more mainstream concept. However, I've seen very little attempts on media or any reasonable layman explanation on the internet as to how the *security* itself works, short of reading Apple's [security white paper](https://www.apple.com/business/docs/iOS_Security_Guide.pdf). And to some extent we can live with that - Apple has implemented brilliant ways of ensuring strong protection can be used, if not understood, by the masses of users.

However, who watches the watchmen? At some point down the road, someone will have to understand what is going on. And not just part of it, the whole end-to-end process. That someone usually ends up being a programmer. You know, someone who designs the system and ensures it does what people want it to do, such as take selfies and send very private messages to other people without being snooped. Surely these people have the keys to the kingdom, and as long as they know what is happening (and they don't install any sneaky backdoors), we should be in good hands. Right?

Well, not quite. In products of all sizes, from something as complicated as a phone to a simple fart app, you will have at least one, but more often than not, two or more people (Notice I've omitted the term *programmer* from the above. Anyone working in a project is liable for its infosec integrity, but to be fair the developers carry the brunt of the responsibility for due diligence and proactive defense) designing, writing code, testing and releasing the product. Depending on the type of product being built and maintained, there are any number of technologies at play - each of which is an [attack surface](https://en.wikipedia.org/wiki/Attack_surface) and is susceptible of spilling its guts out into the world. Not only is it the product itself, but all the tools used, interactions between coworkers, copy-pasted IM conversations over email, unattended cell phones at crowded bars, and any other point in between start and finish that can become the weakest link. 

As a developer in any function, you **will** be trusted with sensitive information. Whether directly through a database login, or indirectly through a frontend interface or a mobile app, or through the handling of information between you and your coworkers. You will not get away from it. And it will be your responsibility to be as knowledgeable as possible about best practices and infosec to protect you, your employer, and your loved ones from malicious attacks. 

So what am I doing about all this? Well, my undergrad did a woefully bad job at letting me know all the possible ways in which systems can get attacked. I'm going the long route in - brushing up on C and computer systems, kernel and memory, as well as network and cryptography. Most importantly, I'll start practicing pentesting and CTF-style attacks (on my personal servers). It's a long bill, but I would be negligent not to do so. You would be, too. 

|)

