#!/bin/bash
set -euo pipefail

FILENAME="$(date --iso-8601="seconds").tar.gz"

rm -rf /root/backup/world
rm -rf /root/backup/world_nether
rm -rf /root/backup/world_the_end

cp -R /root/world /root/backup/.
cp -R /root/world_nether /root/backup/.
cp -R /root/world_the_end /root/backup/.

tar -zcvf /root/backup/${FILENAME} -C /root/backup world world_nether world_the_end > /dev/null

rm -rf /root/backup/world
rm -rf /root/backup/world_nether
rm -rf /root/backup/world_the_end

echo ${FILENAME}
