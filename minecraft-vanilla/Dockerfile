FROM docker.io/openjdk:23-slim-bullseye

ARG VERSION

WORKDIR /root/
COPY ./scripts/download.sh .

RUN apt-get update
RUN apt-get install -y curl jq
RUN apt-get clean

RUN bash ./download.sh ${VERSION}
RUN sha1sum --check server.jar.sha1

EXPOSE 25565
EXPOSE 25575

ENTRYPOINT java -jar -Xms${MEMORY} -Xmx${MEMORY} ./server.jar nogui
