
cd %~dp0

del googledrivesync.exe

call vendor\Bat_To_Exe_Converter.exe -bat googledrivesync.bat -save _googledrivesync.exe  -invisible

call vendor\ResourceHacker.exe -add _googledrivesync.exe, googledrivesync.exe, googledrivesync_icons.res ,,,

del _googledrivesync.exe