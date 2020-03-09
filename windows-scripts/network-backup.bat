set DESTINATION_ROOT="X:\RAZER-BACKUP"
set RC_FLAGS=/S /E /tee /R:10 /W:10 /MT:8

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set _date=%%a%%b%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set _time=%%a%%b)

robocopy %RC_FLAGS% /log+:"LOGS\network-backup-%_date%_%_time%-Pictures.log" "C:\Users\jimmy\Pictures" "%DESTINATION_ROOT%\Pictures"
robocopy %RC_FLAGS% /log+:"LOGS\network-backup-%_date%_%_time%-Videos.log" "C:\Users\jimmy\Videos" "%DESTINATION_ROOT%\Videos"
robocopy %RC_FLAGS% /log+:"LOGS\network-backup-%_date%_%_time%-Documents.log" "C:\Users\jimmy\Documents" "%DESTINATION_ROOT%\Documents"

pause
