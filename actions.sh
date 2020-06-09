#!/bin/bash

DIR_WITH_CHANGES=$(git diff --dirstat=files,0 HEAD~0 | sed 's/^[ 0-9.]\+% //g')

for DIR in ${DIR_WITH_CHANGES}; do
    if [ -d "${DIR}" ]; then
        pushd "${DIR}"

        for DIR_IMAGE in *; do
            if [ -d "$DIR_IMAGE" ]; then
                printf "Compiling '%s' dir..." "${DIR}"
                make login build push TAG="$DIR_IMAGE"
            fi
        done
        
        popd
    fi
done
