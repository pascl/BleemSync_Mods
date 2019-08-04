#!/bin/sh

echo 2 > /data/power/disable
source "/var/volatile/bleemsync.cfg"

$bleemsync_path/bin/sdl_display "/var/volatile/launchtmp/backup.png" &
sleep 4

if [ ! -d "/media/games_backup" ]; then
  
  mkdir -p "/media/games_backup"
  cp -Rfv /gaadata/* /media/games_backup > "/media/copiedfiles.log"
  echo 1 > "/media/backupdone.log"
  df > "/media/df.log"
  $bleemsync_path/bin/sdl_display "/var/volatile/launchtmp/ok.png" &
  sleep 4
else
  echo 1 > /sys/class/leds/red/brightness
  echo 0 > /sys/class/leds/green/brightness
  $bleemsync_path/bin/sdl_display "/var/volatile/launchtmp/error.png" &
  sleep 4
  echo 0 > /sys/class/leds/red/brightness
  echo 1 > /sys/class/leds/green/brightness
fi

echo 0 > /data/power/disable
