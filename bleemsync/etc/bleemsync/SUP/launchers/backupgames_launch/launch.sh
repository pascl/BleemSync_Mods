#!/bin/sh

echo 2 > /data/power/disable
mkdir -p "/media/games_backup"
cp -Rfv /gaadata/* /media/games_backup > "/media/copiedfiles.log"
echo 1 > "/media/backupdone.log"
df > "/media/df.log"
echo 0 > /data/power/disable
