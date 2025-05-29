@echo off
setlocal

:: ----- Configuration: comma-separated directories to ignore -----
set "IGNORE=runtime,venv,env,.venv,.git,__pycache__,src\crawler"

:: Ensure pipreqs is installed
where pipreqs >nul 2>&1 || (
    echo Installing pipreqs...
    pip install pipreqs || exit /b 1
)

echo.
echo Generating requirements.txt (ignoring: %IGNORE%)
echo.

:: Run pipreqs with UTF-8 BOM encoding, greater-than mode, force overwrite
pipreqs . --encoding=utf-8-sig --ignore "%IGNORE%" --mode gt --force || exit /b 1

echo.
echo [SUCCESS] requirements.txt generated.
echo.
type requirements.txt
echo.
echo To install dependencies, run:
echo     pip install -r requirements.txt

endlocal
pause