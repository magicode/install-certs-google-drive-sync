@echo off  

set FILE_CA_CERTS="%LOCALAPPDATA%\Google\Drive\user_default\cacerts"

set CURR_DIR=%~dp0

echo "%CURR_DIR%";

if not exist "%FILE_CA_CERTS%"  goto not_exist_cacerts

:main 

if not exist "%FILE_CA_CERTS%_org" (
	copy "%FILE_CA_CERTS%" "%FILE_CA_CERTS%_org"
)

copy /Y "%FILE_CA_CERTS%_org" "%FILE_CA_CERTS%"

start /b "" "%CURR_DIR%\googledrivesync_src.exe" %*
call :add_certs_and_lock_file %* >> "%FILE_CA_CERTS%"

:add_certs_and_lock_file
echo.
echo.
echo #NetFree add certs
type "%CURR_DIR%\add_certs.crt"
ping -n 30 127.0.0.1 > nul 
exit /b

:not_exist_cacerts
start /b "" "%~dp0\googledrivesync_src.exe" %*
ping -n 5 127.0.0.1 > nul 
wmic Path win32_process Where "Caption Like 'googledrivesync_src.exe'" Call Terminate
goto main
