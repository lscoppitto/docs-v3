#!/bin/sh

DOCPATH=$1

if [ -z "$DOCPATH" ]; then
    DOCPATH=${PWD}
fi

docker run --rm -it -p 8081:8000 -v ${PWD}:/docs squidfunk/mkdocs-material:6.1.7 $2
