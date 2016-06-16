
cd %~dp0

call build.bat

del googledrivesync_exe

copy googledrivesync.exe googledrivesync_exe

call vendor\Bat_To_Exe_Converter.exe -bat install_certs_google_drive_sync.bat -save install_certs_google_drive_sync.exe  -include googledrivesync_exe -upx -overwrite -admin -icon install_icon.ico
