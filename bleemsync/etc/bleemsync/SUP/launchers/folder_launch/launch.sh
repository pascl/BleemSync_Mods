#!/bin/sh

source "/var/volatile/bleemsync.cfg"

echo 2 > /data/power/disable
[ ! -d "$bleemsync_path/etc/bleemsync/SYS/databases-backup" ] && cp -r "$bleemsync_path/etc/bleemsync/SYS/databases" "$bleemsync_path/etc/bleemsync/SYS/databases-backup"
[ ! -f "$bleemsync_path/etc/bleemsync/SYS/databases/stockRegional.db" ] && cp "/gaadata/databases/regional.db" "$bleemsync_path/etc/bleemsync/SYS/databases/stockRegional.db"
cd "/var/volatile/launchtmp"
echo "launch_StockUI" > "/tmp/launchfilecommand"
chmod +x "folder_menu"
./folder_menu --database-folder "$bleemsync_path/etc/bleemsync/SYS/databases" &> "$runtime_log_path/folder.log"

foldersdata=`"$bleemsync_path/bin/sqlite3" "$bleemsync_path/etc/bleemsync/SYS/databases/regional.db" -cmd "SELECT * FROM FOLDER_ENTRIES ORDER BY FOLDER_ID" ".quit"`
IFS=$'\n'      # Change IFS to new line
#echo "$foldersdata" > "/media/test.log"
foldersdata=($foldersdata)
for f in "${foldersdata[@]}"; do
	IFS='|' read -r -a onedata <<< "$f"
	directoryname="$bleemsync_path/etc/bleemsync/SUP/launchers/bsfolder${onedata[0]}"
	if [ ! -d "$directoryname" ]; then
		mkdir -p "$directoryname"
	fi
	echo "launcher_filename=\"folder\"" > "$directoryname/launcher.cfg"
	echo "launcher_title=\"${onedata[1]}\"" >> "$directoryname/launcher.cfg"
	echo "launcher_publisher=\"Folder\"" >> "$directoryname/launcher.cfg"
	echo "launcher_year=\"2019\"" >> "$directoryname/launcher.cfg"
	echo "launcher_sort=\"no\"" >> "$directoryname/launcher.cfg"
	
	echo "#!/bin/sh" > "$directoryname/launch.sh"
	echo "echo 2 > /data/power/disable" >> "$directoryname/launch.sh"
	echo "source \"/var/volatile/bleemsync.cfg\"" >> "$directoryname/launch.sh"
	echo "echo ${onedata[0]} > \"$bleemsync_path/etc/bleemsync/CFG/selected_folder\"" >> "$directoryname/launch.sh"
	echo "cd \"/var/volatile/launchtmp\"" >> "$directoryname/launch.sh"
	echo "echo \"launch_StockUI\" > \"/tmp/launchfilecommand\"" >> "$directoryname/launch.sh"
	
	cp -fv "$bleemsync_path/etc/bleemsync/SUP/launchers/folder_launch/${onedata[2]}" "$directoryname/folder.png"
done
