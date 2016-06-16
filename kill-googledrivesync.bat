@echo off  

wmic Path win32_process Where "Caption Like 'googledrivesync_src.exe'" Call Terminate
