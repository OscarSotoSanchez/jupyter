#!/bin/bash

LAST_COMMIT_ID=$(git log --pretty=format:'%h' -n 1)
DIR_WITH_CHANGES=$(git diff-tree --no-commit-id --name-only -r "${LAST_COMMIT_ID}" | cut -d"/" -f1 | uniq)

for DIR in ${DIR_WITH_CHANGES}; do
    if [ -d "${DIR}" ]; then
        pushd "${DIR}"

        if [ -f "Makefile" ]; then
            for DIR_IMAGE in *; do
                if [ -d "$DIR_IMAGE" ]; then
                    printf "\n\tCompiling '%s'..." "${DIR}/${DIR_IMAGE}"
                    make login build push TAG="$DIR_IMAGE"
                fi
            done
        fi

        popd
    fi
done
