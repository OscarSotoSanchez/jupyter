#!/bin/sh

[ -z "${NOTEBOOK_SECRET}" ] && NOTEBOOK_SECRET=""

# Enable plugings by default
mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/extensionmanager-extension

cat>/root/.jupyter/lab/user-settings/@jupyterlab/extensionmanager-extension/plugin.jupyterlab-settings<<EOF
{
    // Extension Manager
    // @jupyterlab/extensionmanager-extension:plugin
    // Extension manager settings.
    // *********************************************

    // Disclaimed Status
    // Whether the user understand that extensions managed through this interface run arbitrary code that may be dangerous
    "disclaimed": true
}
EOF

# Running jupyter lab
jupyter lab \
    --no-browser \
    --notebook-dir=/workdir/notebooks \
    --NotebookApp.token="${NOTEBOOK_SECRET}" \
    --ip='0.0.0.0' \
    --port=8888 \
    --allow-root
