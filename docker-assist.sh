#!/bin/bash

set -ex
export JEKYLL_VERSION=3.5
docker run --platform linux/amd64 --rm --name newblog --volume="$PWD:/srv/jekyll" \
  -p 3000:4000 \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve --watch --drafts
