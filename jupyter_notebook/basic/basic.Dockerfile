FROM alpine:3.11

# Install required software
RUN apk update \
    && apk add --no-cache python3 \
    build-base \
    python3-dev \
    zeromq-dev \
    freetype-dev \
    libpng-dev \
    && pip3 install --upgrade --no-cache-dir pip \
    setuptools \
    wheel \
    && pip install --upgrade --no-cache-dir jupyter \
    matplotlib \ 
    && ln -s /usr/bin/python3 /usr/bin/python    

# Entrypoint
COPY ./basic.entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh && \
    mkdir -p /workdir/notebooks

WORKDIR /workdir/notebooks
CMD /usr/local/bin/entrypoint.sh
