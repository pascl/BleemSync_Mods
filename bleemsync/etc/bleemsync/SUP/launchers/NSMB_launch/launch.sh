#!/bin/sh
source "/var/volatile/bleemsync.cfg"
source "/var/volatile/launchtmp/launcher.cfg"

cd "/media/bleemsync/etc/bleemsync/SUP/launchers/psc_drastic"
chmod +x "drastic"
echo "launch_StockUI" > "/tmp/launchfilecommand"
LD_PRELOAD=./drastic_sdl_remap.so ./drastic "$pb_rom" > $runtime_log_path/drastic.log 2>&1