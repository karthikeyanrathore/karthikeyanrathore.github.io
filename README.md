# ML Lab – Personal Site

This repository contains the source for my personal site "ML Lab", built with Jekyll and the Minima theme.

## Run locally with Docker (Apple Silicon)

On an Apple Silicon Mac, you can run the site using the provided helper script:

1. Make sure Docker Desktop is running.
2. From the project root, run:

   ```bash
   bash docker-macm1.sh
   ```

3. Open the site in your browser at:

   ```text
   http://localhost:4000/
   ```

## Manual Docker usage

If you prefer to run the container manually, this is the basic flow:

1. Start the Jekyll container and mount the repo:

   ```bash
   docker run -t -d --rm --name newblog \
     --volume="$PWD:/srv/jekyll" \
     -p 4000:4000 \
     -it osvik/jekyll-apple-silicon:v4.2.0.b2
   ```

2. Enter the container shell:

   ```bash
   docker exec -it newblog bash
   ```

3. Inside the container, install dependencies and run Jekyll:

   ```bash
   cd /srv/jekyll
   bundle update
   bundle install
   bundle clean --force
   jekyll serve -H 0.0.0.0 --watch --drafts
   ```

4. Visit the site in your browser:

   ```text
   http://localhost:4000/
   ```
