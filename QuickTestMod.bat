@echo off
setlocal EnableDelayedExpansion

::Set active directory to the dir the bat is in
pushd %~dp0

call UtilityBats/MakeDefaultConfigFiles.bat --noPause
call UtilityBats/LoadVars.bat
call UtilityBats/VerifyVars.bat --noPause
call UtilityBats/CookUEProject.bat --noPause
call UtilityBats/PackageMod.bat --noPause

echo removing old mod pak
del "%SteamInstall%\War\Content\Paks\%ModName%_P.pak" /q

echo copying over new mod pak
move "%cd%\Temp\%ModName%_P.pak" "%SteamInstall%\War\Content\Paks\"

start steam://rungameid/505460