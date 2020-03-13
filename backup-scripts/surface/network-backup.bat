set DESTINATION_ROOT=X:\SURFACE-BACKUP
set RC_FLAGS=/S /E /XX /TEE /R:10 /W:10 /MT:16

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set _date=%%a%%b%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set _time=%%a%%b)

mkdir LOGS\surface

robocopy "C:\Users\jimmy\Pictures" "%DESTINATION_ROOT%\Pictures" %RC_FLAGS% /log+:"LOGS\surface\network-backup-%_date%_%_time%-Pictures.log"
robocopy "C:\Users\jimmy\Videos" "%DESTINATION_ROOT%\Videos" %RC_FLAGS% /log+:"LOGS\surface\network-backup-%_date%_%_time%-Videos.log"
robocopy "C:\Users\jimmy\Documents" "%DESTINATION_ROOT%\Documents" %RC_FLAGS% /log+:"LOGS\surface\network-backup-%_date%_%_time%-Documents.log" /XD "C:\Users\jimmy\Documents\Projects"
robocopy "C:\Users\jimmy\Downloads" "%DESTINATION_ROOT%\Downloads" %RC_FLAGS% /log+:"LOGS\surface\network-backup-%_date%_%_time%-Downloads.log"

pause
