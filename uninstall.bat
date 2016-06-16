
setlocal EnableDelayedExpansion

if exist "%ProgramFiles(x86)%\Google\Drive\googledrivesync_src.exe" (
	set "DRIVE_FOLDER=%ProgramFiles(x86)%\Google\Drive"
)

if exist "%ProgramFiles%\Google\Drive\googledrivesync_src.exe" (
	set "DRIVE_FOLDER=%ProgramFiles%\Google\Drive"
)

if DEFINED DRIVE_FOLDER (
	wmic Path win32_process Where "Caption Like 'googledrivesync_src.exe'" Call Terminate
	
	copy /Y "%DRIVE_FOLDER%\googledrivesync_src.exe" "%DRIVE_FOLDER%\googledrivesync.exe" && ( 
		del /F "%DRIVE_FOLDER%\googledrivesync_src.exe"
		start /b "" "%DRIVE_FOLDER%\googledrivesync.exe"
	)
)
