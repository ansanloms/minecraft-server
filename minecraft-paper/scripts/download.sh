#!/bin/bash
set -euxo pipefail

DOWNLOAD_VERSION="${VERSION:-latest}"
DOWNLOAD_PAPER_BUILD="${PAPER_BUILD:-latest}"

API_BASE_URL="https://papermc.io/api/v2/projects/paper"

if [[ $DOWNLOAD_VERSION == latest ]]
then
  DOWNLOAD_VERSION=$(curl --silent --location ${API_BASE_URL} | jq -r ".versions[-1]")
fi

if [[ $DOWNLOAD_PAPER_BUILD == latest ]]
then
  DOWNLOAD_PAPER_BUILD=$(curl --silent --location ${API_BASE_URL}/versions/${DOWNLOAD_VERSION} | jq -r ".builds[-1]")
fi

curl --location --output server.jar "${API_BASE_URL}/versions/${DOWNLOAD_VERSION}/builds/${DOWNLOAD_PAPER_BUILD}/downloads/paper-${DOWNLOAD_VERSION}-${DOWNLOAD_PAPER_BUILD}.jar"
