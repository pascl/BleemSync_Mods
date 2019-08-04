#!/bin/sh

echo 2 > /data/power/disable
source "/var/volatile/bleemsync.cfg"

$bleemsync_path/bin/sdl_display "/var/volatile/launchtmp/edit.png" &
sleep 4

if [ -f "/media/backupdone.log" ]; then
  myflag="$(head -1 /media/backupdone.log)"
  if [ "$myflag" = "2" ] && [ -d "/media/replaced_games" ]; then
    for i in {1..25}; do
      if [ -d "/gaadata/$i" ]; then
        rm -Rfv "/gaadata/$i"
      fi
    done
    #rm -Rfv /gaadata/databases
    cp -Rfv /media/replaced_games/* /gaadata > "/media/editedfiles.log"
    echo 3 > "/media/backupdone.log"
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
else
  echo 1 > /sys/class/leds/red/brightness
  echo 0 > /sys/class/leds/green/brightness
  $bleemsync_path/bin/sdl_display "/var/volatile/launchtmp/error.png" &
  sleep 4
  echo 0 > /sys/class/leds/red/brightness
  echo 1 > /sys/class/leds/green/brightness
fi

echo 0 > /data/power/disable
