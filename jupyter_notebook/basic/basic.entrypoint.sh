#!/bin/sh

[ -z "${NOTEBOOK_SECRET}" ] && NOTEBOOK_SECRET=""

# Running jupyter notebook
jupyter-notebook \
    --no-browser \
    --notebook-dir=/workdir/notebooks \
    --NotebookApp.token="${NOTEBOOK_SECRET}" \
    --ip='0.0.0.0' \
    --port=8888 \
    --allow-root
