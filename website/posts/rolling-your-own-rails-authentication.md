(:title "Rolling your own Rails Authentication"
  :sub-title ""
  :date "2015-01-25"
  :kind :post
  :text #?|

When I started learning Rails, my assumption is that most everything would be prepackaged and built-up, or rather prepackaged in cute little gems. I fell into one of Rail's [myths](http://david.heinemeierhansson.com/posts/33-myth-4-rails-is-a-monolith) - as it turns out, rails is extremely flexible and it lets you cut out whatever sections you wouldn't want.

I was telling a friend of mine that I planned to roll my own authentication, and while he didn't dissuade me, he did tell me I would be better off taking something like Devise or oAuth and just 'using the gem'. Inherently I thought he was right, but I still wanted to figure out just how difficult it was.

Doing this seems pretty daunting, especially for someone who is just starting out: not just because security is a sensitive topic and it would be disastrous to get it wrong, but also because it sounds *hard* to just roll it up from scratch. However, it is completely doable with Rails - the components are exposed to you, so that you don't neccesarily have to go down to the metal if you want to implement your own solutions.

While researching this I found most SO posts will redirect you to a gem, which in all honesty is the best way to go if you're trying to crank out an app and just want the functionality to work. **But**, if you're learning and want that challenge, it turns out that there's a fantastic resource. Michael Hart'ls [intro to Rails](https://www.railstutorial.org/book/sign_up) includes a gentle, but thorough guide on how to set up your own authentication and session management in Rails.

It all starts out with [`has_secure_password`](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html), which includes suite of validations and authentications needed to save a password digest. It's easy to use and well-documented. It uses an implementation of BCrypt, which is a hashing algorithm that secures your passwords and sensitive data should your database fall in the wrong hands. It is the same secure algorithm [used by github](https://help.github.com/articles/github-security/#maintaining-security), so I figured it would be good enough for me. For more details on BCrypt, see the amusing explanation by [Yorick Peterse](http://yorickpeterse.com/articles/use-bcrypt-fool/).

We can use the same code used by BCrypt in the Rails implementation (via `has_secure_password`) to generate our digests and save them to our models:

```
  def User.digest(input_string)
    cost = ActiveModel::SecurePassword.min_cost ?
      BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(input_string, cost: cost)
  end
```

After that, all it takes is a comparison (also extracted from the Rails BCrypt implementation) to compare your token against a hash:

```
  BCrypt::Password.new(digest).is_password?(token)
```

Throw those into your User model and you can start authenticating passwords!

Another key ingredient that prevents us from rewriting an entire cookie handling library is the `session` and `cookies` [object](http://api.rubyonrails.org/classes/ActionDispatch/Cookies.html). We can write directly into the browser's session or cookies by just **calling** them. Take a second to reflect on how awesome that is, and you can start seeing how its *completely* feasible to write your own logic flow for logins and logouts.

Throughout this excercise, I also ran against the crux of the MVC paradigm: where should it all live? I was particularly stumped by a now obiquitious requirement: checking the current password of my user in order to let them change it in the first place. It was straightforward enough to actually make the change, but where should the verification code live? The controller seems to be able to manage that, but at the same time the model could contain the logic (and even I know this shouldn't go in the view). Some people might even propose an Angular solution. I ultimatley opted to place it in the Model, as all my validation logic would be in one cohesive location and it would flow well with `update_attributes` (some people will see some similarity with the code from a popular auth gem).

My own doubtfulness in my implementation also made me *extra* careful with my tests, and to double-triple check I've asked a couple other folks to take a look at my implementation, as well as cross check with Hartl's guide. So far so good.

With all said and done, there's one last shout-out to the Rails [security guide](http://guides.rubyonrails.org/security.html), which is a must-read for keeping your app and your user data safe.

The only sad part about all this learning is, I will never know if my system is good enough - there's no testing like production.

|)

