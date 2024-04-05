#!/bin/bash
set -euo pipefail

FILENAME="$(date --iso-8601="seconds").tar.gz"

rm -rf /root/backup/world

cp -R /root/world /root/backup/.

tar -zcvf /root/backup/${FILENAME} -C /root/backup world  > /dev/null

rm -rfv /root/backup/world
