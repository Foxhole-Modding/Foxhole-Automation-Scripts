# Foxhole modding automation scripts
This repo contains various bat files to help you automate your projects, including packaging, cooking, and all those fun things. Originally written by Samamstar & Dr. Turtle for [Deep Rock Galactic](https://github.com/DRG-Modding/DRGModdingAutomationScripts).

## Installation/usage
In order to use this I recommend downloading the repo and placing it on folder above your .uproject. Once installed run VerifyVars.bat, and fix any errors in Config.ini

QuickTestMod.bat automatically runs all steps required to test mod locally, by cooking the project, copying it into the local mods folder, and automatically launching Foxhole through Steam

Note: Config.ini has a "Local" and "Global" version. The intention of this is so that it's easy to include the files in your own repo without accidentally doxing yourself. Any settings added to the "Local" config file will automatically overwrite the "Global" setting. 

Consider Local as stuff that will change from computer to computer (E.G. paths to Unreal Engine), and Global as stuff that won't (E.G. ModName)

### LocalConfig.ini/GlobalConfig.ini
Contains various variables the batch files access. Assuming you installed everything in the default location you should only have to change ModName

- Use the local config for settings specific to your machine (Engine path, game install. etc.)
- Use the global config for settings that wouldn't be specific to your machine (ModName) 

**Any variables defined in LocalConfig.ini will overwrite the GlobalConfig.ini's value.**

| Variable | Description | Default value |
| --- | --- | --- |
| ProjectFile | Represents the location of the .uproject you want to work with. Can be a relative path. | ..\War\War.uproject |
| UnrealEngineLocation | Represents the location that UE4.25 is installed in. Expects the folder which CONTAINS Engine\\ | C:\Program Files (x86)\UE_4.24
| ModName | Used by the bats when making your pak name, and in one or two other places. | myMod |
| SteamInstall | The folder the game is installed in. Expects the folder containing War.exe | C:\Program Files (x86)\Steam\steamapps\common\Foxhole |

### CookUEProject.bat
Runs UE4Editor-Cmd.exe in order to cook the mod files. You can find the cooked files in ProjectFolder\Saved\Cooked\WindowsNoEditor

### CopyWhitelistedFiles.bat
Copies all files/folders in PakWhiteList.ini and automatically copies them into Temp\PackageInput\Content from `ProjectFolder`\Saved\Cooked\WindowsNoEditor\\`ProjectName`\Content

### MakeDefaultConfigFiles.bat
If config.ini, PakWhiteList.ini, or PakWhiteList.ini are missing this bat will create the default version

### PackageMod.bat
Calls `CopyWhitelistedFiles.bat`, `StripBlacklistedFiles.bat` then packages into `"ModName"_P.pak`

### PrepModForRelease
Calls CookUEProject.bat, PackageMod.bat, then automatically zips the pak up, with a suffix (I recommend your mod version)

Zip gets named `"ModName""Suffix".zip`

### QuickTestMod.bat
Calls `CookUEProject.bat`, `PackageMod.bat`, then automatically moves the mod pak into Foxhole's local testing folder

### StripBlacklistedFiles.bat
Deletes all files/folders in PakBlackList.ini from Temp\PackageInput\Content

### VerifyVars.bat
Checks whether the variables in Config.ini are valid. If not, exits to prevent any odd issues and informs the user which variables need fixing. Is called by every other bat before they do much of anything

# Credits
Samamstar for original bats
Buckminsterfullerene for the Foxhole port