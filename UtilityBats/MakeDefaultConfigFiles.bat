@echo off

rem Set active directory to main automation dir 
pushd %~dp0
cd ..

if not exist Configs/ (
	mkdir Configs
)

if not exist Configs/LocalConfig.ini (
	echo making default Local config
	(
		echo ProjectFile=..\War\War.uproject
		echo UnrealEngineLocation=C:\Program Files ^(x86^)\UE_4.24\
		echo SteamInstall=C:\Program Files ^(x86^)\Steam\steamapps\common\Foxhole\
	) > Configs/LocalConfig.ini
)

if not exist Configs/GlobalConfig.ini (
	echo making default global config
	(
		echo ModName=myMod
	) > Configs/GlobalConfig.ini
)

if not exist Configs/PakWhiteList.ini (
	echo making default PakWhiteList
	(
		echo ..\Content
	) > Configs/PakWhiteList.ini
)

if not exist Configs/PakBlackList.ini (
	echo making default PakBlackList
	copy nul PakBlackList.ini 
	move PakBlackList.ini Configs/PakBlackList.ini 
)