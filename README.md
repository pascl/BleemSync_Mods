# Modding BleemSync 1.1 files

Modified files of BleemSync which permits:
* Rom launchers from stock UI
* Folders

**THIS MOD IS NOT SUPPORTED BY THE BLEEMSYNC DEVS. I MODIFIED SCRIPTS ON THE DRIVE MYSELF TO HAVE THIS RESULT.**

### Useful Tools:
* BleemSync 1.1 - use this mod as a base. Be sure you have run at least once your drive before modifying it [https://modmyclassic.com/bleemsync/]
* pbPSCReAlpha (1.3+) - can generate multi DB files to split games in folders [https://github.com/pascl/pbPSCReAlpha]
* pbImgUtils - can resize pictures and add text easily creating several files at once [https://github.com/pascl/pbImgUtils]
* COMING SOON - pbPSCBSLauncherGenerator - auto-generate launchers by scanning folders [https://github.com/pascl/pbPSCBSLauncherGenerator]

### Links:
* https://www.youtube.com/watch?v=OMapxlnn_2w

---------------------------------------------
Some step videos...
* https://www.youtube.com/watch?v=iQ6g5x0tvdQ
* https://www.youtube.com/watch?v=ug415HeSAkY
* https://www.youtube.com/watch?v=pCT1Tb84IDo
* https://www.youtube.com/watch?v=dg1xb844qTo
* https://www.youtube.com/watch?v=oB_v5ZvyT-U
* https://www.youtube.com/watch?v=gNUS0qr61B4
* https://www.youtube.com/watch?v=6gOyCeKkU5c
* https://www.youtube.com/watch?v=gq2yYccuQi8

### How to
#### Add a rom launcher for a RetroArch core
* Take as base an example (for example zeldaDX_launch), and copy/paste it to your drive.
* There are 3 files in the folder:
  * launch.sh - Leave it as is, no modifications are needed in it. This will be the same for all games launched with RetroArch for any cores.
  * launcher.cfg - Need to be edited, contains all the parameters:
    * launcher_filename: the png filename. Needs to be without any special characters (points, commas, accents, ...). To simplify, you can leave the same filename in each launcher.
	* launcher_title: the title visible on the PSC.
	* launcher_publisher: the publisher visible on the PSC.
	* launcher_year: the release year visible on the PSC.
	* pb_core: the path to the wanted core.
	* pb_rom: the path to the wanted rom.
	* pb_parentfolder: the folder where the launcher will be visible. If absent, will be visible everywhere.
  * XXXXX.png - The picture visible on the PSC. Rename it to match the "launcher_filename" parameter of the cfg file.

#### Add a rom launcher for DraStic
* Take as base an example (for example NSMB_launch), and copy/paste it to your drive.
* There are 3 files in the folder:
  * launch.sh - Leave it as is, no modifications are needed in it. This will be the same for all DS games launched with DraStic.
  * launcher.cfg - Need to be edited, contains all the parameters:
    * launcher_filename: the png filename. Needs to be without any special characters (points, commas, accents, ...). To simplify, you can leave the same filename in each launcher.
	* launcher_title: the title visible on the PSC.
	* launcher_publisher: the publisher visible on the PSC.
	* launcher_year: the release year visible on the PSC.
	* pb_rom: the path to the wanted rom.
	* pb_parentfolder: the folder where the launcher will be visible. If absent, will be visible everywhere.
  * XXXXX.png - The picture visible on the PSC. Rename it to match the "launcher_filename" parameter of the cfg file.

#### Have a home icon
* The example folder_0 is my Home icon.
* This icon appears everywhere except on the first screen of the PSC.

#### Create a folder
* Take as base an example (for example folder_1), and copy/paste it to your drive.
* * There are 3 files in the folder:
  * launch.sh - Leave it as is, no modifications are needed in it. This will be the same for all folders.
  * launcher.cfg - Need to be edited, contains all the parameters:
    * launcher_filename: the png filename. Needs to be without any special characters (points, commas, accents, ...). To simplify, you can leave the same filename in each launcher.
	* launcher_title: the title visible on the PSC.
	* launcher_publisher: the publisher visible on the PSC (not really useful for a folder but it's needed).
	* launcher_year: the release year visible on the PSC (not really useful for a folder but it's needed).
	* pb_dbfile: the database filename to be used for this folder (regional.db, regionalX.db or empty.db generated by pbPSCReAlpha if you don't want any PS1 games in this folder).
	* pb_idfolder: the folder number, which serves as identifier.
	* pb_parentfolder: the folder where the folder will be visible. If absent, will be visible everywhere.
  * XXXXX.png - The picture visible on the PSC. Rename it to match the "launcher_filename" parameter of the cfg file.

#### Understand the folder identifiers and their special uses
* For the pb_idfolder parameter:
  * 10 is the first screen at startup (this is why it is in folder_0 example, which goes back to it)
  * It is free to use with any unsigned integer, but I recommend not using the value 0 and the values divisible by 100 (see below).
* For the pb_parentfolder:
  * -1 : visible everywhere.
  * 10 : visible on the first screen (home folder).
  * 0 : visible in all the folders with identifiers between 0 and 99 (home folder included).
  * 100 : visible in all the folders with identifiers between 100 and 199.
  * 200 : visible in all the folders with identifiers between 200 and 299.
  * And so on...

In the examples:
* folder_0 - link to home, appears everywhere (except on home screen).
* folder_1 - link to folder1, appears in home and all other folders that you will create with identifiers between 0 and 99.
* folder_roms - link to other systems, appears only on home screen.

#### Sort or not these rom launchers/folders
* For each launcher, you can add in the cfg file the line: launcher_sort="no"
* This launcher/folder won't be sort alphabetically with the others.
* Personnaly, I added this parameter in all folders (to have all of them together at the end) and not in the rom launchers.