FROM docker.io/openjdk:23-slim-bullseye

WORKDIR /root/

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get clean

RUN curl --location --output server.jar https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar

EXPOSE 25565
EXPOSE 25575

ENTRYPOINT java -jar -Xms${MEMORY} -Xmx${MEMORY} ./server.jar nogui
