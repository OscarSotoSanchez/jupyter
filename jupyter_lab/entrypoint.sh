#!/bin/sh

[ -z "${NOTEBOOK_SECRET}" ] && NOTEBOOK_SECRET=""

jupyter lab \
    --no-browser \
    --notebook-dir=/workdir/notebooks \
    --NotebookApp.token="${NOTEBOOK_SECRET}" \
    --ip='0.0.0.0' \
    --port=8888 \
    --allow-root
