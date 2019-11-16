# Modding BleemSync 1.2 files

Modified files of BleemSync which permits:
* Launch CHD files (with "use RA from StockUI")
* Create launchers for folders
* Manage folder for launchers (and by extension have subfolders)

**THIS MOD IS NOT SUPPORTED BY THE BLEEMSYNC DEVS. I MODIFIED SCRIPTS ON THE DRIVE MYSELF TO HAVE THIS RESULT.**

### Useful Tools:
* BleemSync 1.2 - use this mod as a base. Be sure you have run at least once your drive before modifying it [https://modmyclassic.com/bleemsync/]
* pbPscReAlpha 1.6 - use this to manage your games from a PC. This version adds a folder manager and creates folder icons on carousel (if used with BS1.2) [https://github.com/pascl/pbPSCReAlpha/releases]

### Links:
* Replacing internal games: https://youtu.be/IQk6d9z3b3Q


### How to
#### Launch CHD files (from Stock UI)
* Replace the intercept file in bleemsync/etc/bleemsync/SUP/scripts/
* Enable the "use RA from stockUI" in BleemSync options (L1 in BootMenu)

#### Create launchers for folders (useless if you are using pbPscReAlpha1.6)
* Replace the launch.sh file in bleemsync/etc/bleemsync/SUP/launchers/folder_launch/
* Some pictures are in bleemsync/etc/bleemsync/SUP/launchers/folder_launch/images/ if you want more pictures.
* Launch the folder manager on your PSC and manage your folders.
* Exit the folder manager and it should create launchers for each folder. **IT CREATES AND OVERWRITES IF THEY ALREADY EXIST. IT CANT DELETE A LAUNCHER, YOU HAVE TO DO IT MANUALLY**

#### Have subfolders
* I use launchers mainly to have folder icons in the carousel. This add the possibility to display/hide the icon according to the current folder. And so have subfolders.
* Replace the 0050_bleemsync.funcs file in bleemsync/etc/bleemsync/FUNC/
* In launchers (bleemsync/etc/bleemsync/SUP/launchers/), use notepadd++ (or similar) and add the line **launcher_folder="1,2"** in the launcher.cfg file to display this launcher only in folders 1 and 2 (in this case).
* If a launcher doesn't have this line in its cfg file, the launcher will be displayed everywhere.
  * For example:
    * You have these folders and the matching launchers (in bsfolderX folders if you generated them with pbPscReAlpha1.6):
      * A-L (id 1)
      * GB (2)
      * M-Z (3)
      * NES (4)
      * Others (5)
	  * PS1 (6)
      * SNES (7)
	* If you want to organize them like this, add these lines in launcher.cfg:
	  * PS1
	    * A-L -> launcher_folder="3,6"
	    * M-Z -> launcher_folder="1,6"
	  * Others
	    * GB -> launcher_folder="5"
		* NES -> launcher_folder="5"
		* SNES -> launcher_folder="5"
	* **WARNING** pbPscReAlpha removes and overwrites the bsfolderX folders during database generation. You will have to redo these modifications after usage.