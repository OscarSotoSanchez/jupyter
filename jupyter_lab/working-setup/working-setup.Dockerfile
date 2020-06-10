FROM oscarsotosanchez/jupyter-lab:basic

# Install Libraries
RUN apk add --update --no-cache g++ \
    make \
    build-base \
    libpng-dev \
    freetype-dev \
    libexecinfo-dev \
    openblas-dev \
    libgomp \
    lapack-dev \
    libgcc \
    libquadmath \
    musl \
    libgfortran \
    lapack-dev \
    nodejs \
    nodejs-npm \
    git \
    && pip install --upgrade --no-cache-dir numpy==1.17.3 \
    scipy==1.3.1 \
    pandas \
    seaborn

# Install Jupyter Lab extensions
RUN jupyter labextension install @jupyterlab/toc
