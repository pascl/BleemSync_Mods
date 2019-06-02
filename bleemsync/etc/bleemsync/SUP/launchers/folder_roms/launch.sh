#!/bin/sh
source "/var/volatile/launchtmp/launcher.cfg"
echo -e "pb_currentdbfile=\"$pb_dbfile\"\npb_currentidfolder=$pb_idfolder" > "/var/volatile/pb_folder.flag"