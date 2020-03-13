set DESTINATION_ROOT=X:\RAZER-BACKUP
set RC_FLAGS=/S /E /XX /TEE /R:10 /W:10 /MT:16

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set _date=%%a%%b%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set _time=%%a%%b)

mkdir LOGS\razer

robocopy "C:\Users\jimmy\Downloads" "%DESTINATION_ROOT%\Downloads" %RC_FLAGS% /log+:"LOGS\razer\network-backup-%_date%_%_time%-Downloads.log"

pause
