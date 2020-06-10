#!/bin/bash

LAST_COMMIT_ID=$(git log --pretty=format:'%h' -n 1)
LAST_CHANGES=$(git diff-tree --no-commit-id --name-only -r "${LAST_COMMIT_ID}")

printf "\n  ======================================="
printf "\n  =     BUILD JUPYTER LAB IMAGES        ="
printf "\n  ======================================="
printf "\n"

BUILD_IMAGES=$(echo "${LAST_CHANGES}" | grep "jupyter_lab" | cut -d"/" -f2)
COMPILE=false

while IFS= read -r IMAGE; do
    if echo "${BUILD_IMAGES}" | grep -w "${IMAGE}" > /dev/null; then
        printf "\n  Building %s image..." "${IMAGE}"
        make login build push TAG="${IMAGE}"
        COMPILE=true
    fi
done < "order_build_jupyter_lab"

[ ${COMPILE} == false ] && printf "\n  Without images to compile"

printf "\n"
printf "\n  ======================================="
printf "\n  =    BUILD JUPYTER NOTEBOOK IMAGES    ="
printf "\n  ======================================="
printf "\n"

BUILD_IMAGES=$(echo "${LAST_CHANGES}" | grep "jupyter_notebook" | cut -d"/" -f2)
COMPILE=false

while IFS= read -r IMAGE; do
    if echo "${BUILD_IMAGES}" | grep -w "${IMAGE}" > /dev/null; then
        printf "\n Building %s image..." "${IMAGE}"
        make login build push TAG="${IMAGE}"
        COMPILE=true
    fi
done < "order_build_jupyter_notebook"

[ ${COMPILE} == false ] && printf "\n  Without images to compile"

printf "\n\n"
