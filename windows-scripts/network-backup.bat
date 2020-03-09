set DESTINATION_ROOT=X:\RAZER-BACKUP
set RC_FLAGS=/S /E /XX /TEE /R:10 /W:10 /MT:16

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set _date=%%a%%b%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set _time=%%a%%b)

robocopy "C:\Users\jimmy\Pictures" "%DESTINATION_ROOT%\Pictures" %RC_FLAGS% /log+:"LOGS\network-backup-%_date%_%_time%-Pictures.log" /XD C:\Users\jimmy\Pictures\Photography
robocopy "C:\Users\jimmy\Videos" "%DESTINATION_ROOT%\Videos" %RC_FLAGS% /log+:"LOGS\network-backup-%_date%_%_time%-Videos.log"
robocopy "C:\Users\jimmy\Documents" "%DESTINATION_ROOT%\Documents" %RC_FLAGS% /log+:"LOGS\network-backup-%_date%_%_time%-Documents.log"

pause
