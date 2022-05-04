#!/bin/bash

for f in */; do

    if [[ -d "$f" ]]; then
        # Will not run if no directories are available
        pushd $f
            buildah bud -t $(basename $PWD) .
        popd
    fi
done
