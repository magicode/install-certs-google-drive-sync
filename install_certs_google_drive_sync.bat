setlocal EnableDelayedExpansion

set CURR_DIR=%~dp0

powershell -Command "(New-Object Net.WebClient).DownloadFile('http://netfree.link/netfree-ca.crt', '%CURR_DIR%\add_certs.crt')"

if exist "%ProgramFiles(x86)%\Google\Drive\googledrivesync.exe" (
	set "DRIVE_FOLDER=%ProgramFiles(x86)%\Google\Drive"
)

if exist "%ProgramFiles%\Google\Drive\googledrivesync.exe" (
	set "DRIVE_FOLDER=%ProgramFiles%\Google\Drive"
)

if DEFINED DRIVE_FOLDER (
	if not exist "%DRIVE_FOLDER%\googledrivesync_src.exe" (
		wmic Path win32_process Where "Caption Like 'googledrivesync.exe'" Call Terminate
		move "%DRIVE_FOLDER%\googledrivesync.exe" "%DRIVE_FOLDER%\googledrivesync_src.exe"
		copy "%CD%\googledrivesync_exe" "%DRIVE_FOLDER%\googledrivesync.exe"
		copy "%CURR_DIR%\add_certs.crt" "%DRIVE_FOLDER%\add_certs.crt" 
		start /b "" "%DRIVE_FOLDER%\googledrivesync.exe"
	)
)
