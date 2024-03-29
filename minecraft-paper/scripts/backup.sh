#!/bin/bash
set -euxo pipefail

now=$(date +%Y%m%d%H%M)
backupPath="/root/backup/world-${now}.tar.gz"

cp -R /root/world /root/backup/.
cp -R /root/world_nether /root/backup/.
cp -R /root/world_the_end /root/backup/.

tar -zcvf ${backupPath} -C /root/backup world world_nether world_the_end

rm -rfv /root/backup/world
rm -rfv /root/backup/world_nether
rm -rfv /root/backup/world_the_end
