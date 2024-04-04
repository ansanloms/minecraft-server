FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /opt/data

ARG MCC_VERSION
ARG MCC_ARCH

RUN curl --location --output /opt/MinecraftClient "https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/${MCC_VERSION}/MinecraftClient-${MCC_VERSION}-linux-${MCC_ARCH}"

RUN chmod +x /opt/MinecraftClient

ENTRYPOINT ["/opt/MinecraftClient"]
