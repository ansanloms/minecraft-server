FROM docker.io/alpine:3.20.0

ENV MCRCON_HOST=${MCRCON_HOST}
ENV MCRCON_PORT=${MCRCON_PORT}
ENV MCRCON_PASS=${MCRCON_PASS}

RUN apk add --update make gcc musl-dev curl

RUN curl --location --output mcrcon.tar.gz https://github.com/Tiiffi/mcrcon/archive/refs/tags/v0.7.2.tar.gz
RUN tar -zxvf mcrcon.tar.gz
RUN cd ./mcrcon-0.7.2 && make && make install

RUN rm mcrcon.tar.gz
RUN rm -rf ./mcrcon-0.7.2
RUN apk del make gcc musl-dev curl

ENTRYPOINT ["mcrcon"]
