FROM docker.io/amazoncorretto:21.0.2-al2023-headless

ARG VERSION
ARG PAPER_BUILD

WORKDIR /root/
COPY ./scripts/download.sh .

RUN yum install -y jq tar gzip
RUN yum clean all

RUN bash ./download.sh ${VERSION} ${PAPER_BUILD}

EXPOSE 25565
EXPOSE 25575

# Dynmap
EXPOSE 8123

ENTRYPOINT java -Xmx${MEMORY} -Xms${MEMORY} -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar ./server.jar --nogui
