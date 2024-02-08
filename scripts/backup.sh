#!/bin/bash
set -euxo pipefail

now=$(date +%Y%m%d%H%M)
backupPath="/root/backup/world-${now}.tar.gz"

mcrcon "say backup..." save-all

cp -R /root/world /root/backup/.
tar -zcvf ${backupPath} -C /root/backup world
rm -rfv /root/backup/world

mcrcon "say backup completed: ${backupPath}"
