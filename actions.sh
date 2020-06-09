#!/bin/bash

DIR_WITH_CHANGES=$(git diff --dirstat=files,0 HEAD~1 | sed 's/^[ 0-9.]\+% //g')

for DIR in ${DIR_WITH_CHANGES}; do
    if [ -d "${DIR}" ]; then
        pushd "${DIR}"

        if [ -f "Makefile" ]; then
            for DIR_IMAGE in *; do
                if [ -d "$DIR_IMAGE" ]; then
                    printf "Compiling '%s'..." "${DIR}/${DIR_IMAGE}"
                    make login build push TAG="$DIR_IMAGE"
                fi
            done
        fi

        popd
    fi
done
