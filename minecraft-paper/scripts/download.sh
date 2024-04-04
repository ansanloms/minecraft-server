#!/bin/bash
set -euxo pipefail

VERSION="$1"
PAPER_BUILD="$2"

API_BASE_URL="https://papermc.io/api/v2/projects/paper"

if [[ $VERSION == latest ]]
then
  VERSION=$(curl --silent --location ${API_BASE_URL} | jq -r ".versions[-1]")
fi

if [[ $PAPER_BUILD == latest ]]
then
  PAPER_BUILD=$(curl --silent --location ${API_BASE_URL}/versions/${VERSION} | jq -r ".builds[-1]")
fi

curl --location --output server.jar "${API_BASE_URL}/versions/${VERSION}/builds/${PAPER_BUILD}/downloads/paper-${VERSION}-${PAPER_BUILD}.jar"
