set DESTINATION=X:\Photography
set RC_FLAGS=/S /E /XX /TEE /R:10 /W:10 /MT:16

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set _date=%%a%%b%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set _time=%%a%%b)

robocopy "C:\Users\jimmy\Pictures\Photography" "%DESTINATION%" %RC_FLAGS% /log+:"LOGS\razer\photography-backup-%_date%_%_time%.log"

pause
