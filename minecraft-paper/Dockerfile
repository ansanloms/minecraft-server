FROM docker.io/amazoncorretto:21.0.2-al2023-headless

WORKDIR /root/
COPY ./scripts/download.sh .

RUN yum install -y jq tar gzip
RUN yum clean all

RUN bash ./download.sh

EXPOSE 25565
EXPOSE 25575

ENTRYPOINT java -jar -Xms${MEMORY} -Xmx${MEMORY} ./server.jar nogui
