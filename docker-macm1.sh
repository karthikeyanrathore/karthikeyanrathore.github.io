#!/bin/bash

set -ex
docker run -t -d  --rm --name newblog --volume="$PWD:/srv/jekyll" \
  -p 4000:4000 \
  -it osvik/jekyll-apple-silicon:v4.2.0.b2 \
  /bin/bash -c "cd srv/jekyll && bundle update && bundle install && bundle clean --force && jekyll serve -H 0.0.0.0 --watch --drafts"
