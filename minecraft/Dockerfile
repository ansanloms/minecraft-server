FROM docker.io/openjdk:23-slim-bullseye

WORKDIR /root/

ENV MCRCON_HOST=${MCRCON_HOST}
ENV MCRCON_PORT=${MCRCON_PORT}
ENV MCRCON_PASS=${MCRCON_PASS}

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get clean

RUN curl --location --output server.jar https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar

RUN curl --location --output mcrcon-0.7.2-linux-x86-64.tar.gz https://github.com/Tiiffi/mcrcon/releases/download/v0.7.2/mcrcon-0.7.2-linux-x86-64.tar.gz
RUN tar -zxvf mcrcon-0.7.2-linux-x86-64.tar.gz
RUN mv ./mcrcon /usr/local/bin

EXPOSE 25565
EXPOSE 25575

ENTRYPOINT java -jar -Xms${MEMORY} -Xmx${MEMORY} ./server.jar nogui
