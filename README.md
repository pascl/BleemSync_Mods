# Modding BleemSync 1.2 files

Modified files of BleemSync which permits:
* Have savestates on stock UI from RetroArch games

**THIS MOD IS NOT SUPPORTED BY THE BLEEMSYNC DEVS. I MODIFIED SCRIPTS ON THE DRIVE MYSELF TO HAVE THIS RESULT.**

### Useful Tools:
* BleemSync 1.2 - use this mod as a base. Be sure you have run at least once your drive before modifying it [https://modmyclassic.com/bleemsync/]
* pbPscReAlpha 1.6+ - use this to manage your games from a PC. This version adds a folder manager and creates folder icons on carousel (if used with BS1.2) [https://github.com/pascl/pbPSCReAlpha/releases]

### Links:
* Fast demo: https://youtu.be/wq1ZYTJiGxg


### How to
#### Have RetroArch savestates in stock UI
* It works, but it is not optimal:
  * The way RetroArch and the game are launched is inspired by the "launch RA from UI" option.
  * The cfg file is mirrored launching a savestate like that. If you modify some options, they will be lost at exit.
  * You have to quit RetroArch by the menu if you want a screenshot. If you press Reset, there won't be a picture.
  * Even doing that, it seems that some cores won't generate a picture and may fail saving or loading savestates (seen with n64 cores for example).
* Replace the intercept file in bleemsync/etc/bleemsync/SUP/scripts/
* Replace the 0030_retroarch.funcs file in bleemsync/etc/bleemsync/FUNC/
* Add the emblem-important.png file in the root of your drive
* In each of your game folders you want to launch RetroArch, you need to:
  * Remove the launch.sh file you should have
  * Add a txt file with the .rapsc extension. The filename has to match the Discs information of the game.ini file (if you have Discs=ZeldaGB in game.ini, the file has to be ZeldaGB.rapsc).
    * Content of this file: the link to the rom file and the used core.
	* Here is an example:
```
rom_link="/media/roms/Nintendo GB-GBC/Legend of Zelda, The - Link's Awakening (F).gb"
rom_core="gambatte_libretro.so"
```
* This mod is not supported by pbPSCReAlpha, re-add a launch.sh (even empty) in your game folders to regenerate database. Then you'll have to remove these files again before launching the games.