#!/bin/bash

BASE_DIR=$(cd "$(dirname "$0")"; cd ..; pwd)

#    -v "$BASE_DIR/Your_Posts_Archives/example_components":"/data/website/posts/components" \
#    -v "$BASE_DIR/Your_Posts_Archives/example_posts":"/data/website/posts/document" \

docker run --rm -it \
    -p 4000:80 \
    -v "$BASE_DIR/Your_Posts_Archives/posts":"/data/website/posts" \
    -v "$BASE_DIR/Website/_config.yml":"/data/website/_config.yml" \
    document/builder