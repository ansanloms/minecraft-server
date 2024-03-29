#!/bin/bash

DOWNLOAD_VERSION="${VERSION:-latest}"

# Get the latest MC version
if [[ $DOWNLOAD_VERSION == latest ]]
then
  DOWNLOAD_VERSION=$(curl --silent --location https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r ".latest.release")
fi

PACKAGE_JSON_URL=$(curl --silent --location https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r ".versions[] | select(.id == \"${DOWNLOAD_VERSION}\") | .url")
DOWNLOAD_INFO=$(curl --silent --location ${PACKAGE_JSON_URL} | jq -r ".downloads.server")

curl --location --output server.jar "$(echo "${DOWNLOAD_INFO}" | jq -r ".url")"
echo "$(echo "${DOWNLOAD_INFO}" | jq -r ".sha1")  server.jar" > server.jar.sha1
