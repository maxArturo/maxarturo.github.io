---
title: Install arbitrary node versions on Docker container via nvm
subtitle: 
date: 2016-10-21
author: Max A
---
<section>

We've been using Docker to run our Node tests and encapsulate odd depencencies for a while now,  and it's worked out pretty well. We have a "baked-in" Node version via an official Node build, and add a couple of Docker layers on top for our needs. However, we're in the middle of upgrading to Node 6, and we're running into snags upgrading packages and extricating the mountain of Babel dependencies from our codebase (we'll survive with ES6 for now). What this means is we're flipping between Node versions and we need to have a way to run CI tests on Docker on an arbitrary Node version.

One way of solving this problem is having different Docker images for the versions you're targeting and configure the CI (Teamcity in this case) to watch for specific git branches, then use the appropriate Docker image. Another, hackier but more flexible solution is to select and use a Node version at `docker run`-time based on a `.nvmrc` file [^1].

[^1]: "But wait!", I hear you say. Doesn't that mean that you'll have an external dependency and you'll install Node every time you run your tests?! I would look off into the horizon, and say, *Sometimes we need to push the agenda forward. Sometimes we must do non-kosher, hacky things to keep the builds going.* Especially when you have limited server control and build configs.

The purpose of this post is not to defend the choice of installing Node every time we do `docker run` (its indefensible) nor to advocate that you should (you really shouldn't), but rather to show a way of running arbitrary Node versions on a Docker container, should you choose to do so. It's actually not complicated - though there is some `ENV` juggling necessary, due to the nature of nvm.

Here's the heart of the matter:

```dockerfile
# Substituting sh for bash here to use `source`. Beware - your build times could be
# longer if you are doing shell-intensive tasks!
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# any necessary setup steps here...

# We're just setting it to the root user's home (root is default on docker)
# though you could set it to your' user's home if you need a non-root user
ENV NVM_DIR=/root/.nvm

# install nvm on the home dir above
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# make a folder for the app, why not
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# rely on project's .nvmrc file to install the appropriate version and run tests
CMD source ~/.nvm/nvm.sh && cd /usr/src/app && nvm install && npm i && npm test
```

Of interest are really these two parts:

```dockerfile
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
#...
CMD source ~/.nvm/nvm.sh && cd /usr/src/app && nvm install && npm i && npm test
```

The first subs `sh` for `bash`, allowing us to `source` files for running subsequent commands. The second activates `nvm` and installs a given node version, followed by any node commands needed.

This is *not* supposed to be a permanent or prod solution, but it gets the job done. Fun to do, but it's going out as soon as we're done with our upgrades!

</section>