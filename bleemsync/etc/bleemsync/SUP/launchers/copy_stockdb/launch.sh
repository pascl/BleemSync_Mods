#!/bin/sh

source "/var/volatile/bleemsync.cfg"

echo 2 > /data/power/disable
cp -f "/gaadata/databases/regional.db" "$bleemsync_path/etc/bleemsync/SYS/databases/stockRegional.db"
echo 0 > /data/power/disable
