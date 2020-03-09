for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (
	set _date=%%a%%b%%c
	)

Robocopy /S /E /tee /R:10 /W:10 /MT:8 /log+:"LOGS\%_date%.log" "." "X:\Photography"

PAUSE
