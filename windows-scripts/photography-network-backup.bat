set DESTINATION="X:\Photography"
set RC_FLAGS=/S /E /tee /R:10 /W:10 /MT:8

for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set _date=%%a%%b%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set _time=%%a%%b)

robocopy %RC_FLAGS% /log+:"LOGS\%_date%_%_time%.log" "." "%DESTINATION%"

pause
