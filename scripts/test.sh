#!/bin/bash

docker run -it \
            -p 4000:80 \
            -v /Users/soulteary/Code/document-builder/Website/source:/data/website/source \
            -v /Users/soulteary/Code/document-builder/Website/_config.yml:/data/website/_config.yml \
            document/builder server