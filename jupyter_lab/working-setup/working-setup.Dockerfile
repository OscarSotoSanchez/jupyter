FROM oscarsotosanchez/jupyter-lab:basic

# Install Libraries
RUN apk add --update nodejs \
    nodejs-npm \
    git \
    && pip install --upgrade --no-cache-dir pandas

# Install Jupyter Lab extensions
RUN jupyter labextension install @jupyterlab/toc
