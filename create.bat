@echo off 
for /F "tokens=1" %%i in (channelidlist.txt) do call :process %%i
:process
set VAR1=%1
if exist "package\messages\%1\" (
  echo %1:
  for /f "usebackq tokens=1-4 delims=," %%a in ("package\messages\%1\messages.csv") do (
  SET "var="&for /f "delims=0123456789" %%i in ("%%a") do set var=%%i
  if NOT defined var (echo|set /p= %%a,)
  )
  echo.
  echo. 
)>>output.txt