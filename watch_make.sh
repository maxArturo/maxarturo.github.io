#!/bin/sh

WATCH_DIR="./site/posts"

# Watch for changes and run `make` whenever a file changes

fswatch "$WATCH_DIR" | while read -r event
do
  make
done

