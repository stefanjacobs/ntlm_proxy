@echo off

rem Kill the old cntlm process, if it exists
taskkill /F /IM cntlm.exe

rem Wait for 10 seconds (that is for waiting to the VPN working correctly)
echo Waiting, please be patient...
timeout 10 >nul

rem And start again the cntlm process again in the background
"C:\Program Files (x86)\Cntlm\cntlm.exe"

