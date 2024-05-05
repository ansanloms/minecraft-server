#!/bin/bash
set -euo pipefail

FILENAME="$(date --iso-8601="seconds").tar.gz"

rm -rf /root/backup/worlds

cp -R /root/worlds /root/backup/.

tar -zcvf /root/backup/${FILENAME} -C /root/backup worlds > /dev/null

rm -rf /root/backup/worlds

echo ${FILENAME}
