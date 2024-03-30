#!/bin/bash
set -euxo pipefail

cp -R /root/world /root/backup/.
cp -R /root/world_nether /root/backup/.
cp -R /root/world_the_end /root/backup/.

tar -zcvf /root/backup/$(date --iso-8601="seconds").tar.gz -C /root/backup world world_nether world_the_end

rm -rfv /root/backup/world
rm -rfv /root/backup/world_nether
rm -rfv /root/backup/world_the_end
