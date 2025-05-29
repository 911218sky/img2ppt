@echo off
setlocal

:: ----- Configuration -----
:: Path to the Python script to bundle (relative to project root)
set "SCRIPT=src\main.py"
:: Name of the output executable (without .exe)
set "NAME=img2ppt"
:: Optional icon flag, e.g.: --icon resources\app.ico
set "ICON="
:: Any additional PyInstaller options, e.g.: --hidden-import=module --add-data "data;data"
set "EXTRA="

:: Change directory to project root (parent of this script file)
cd /d "%~dp0..\"

:: Verify main script exists
if not exist "%SCRIPT%" (
    echo [ERROR] Script "%SCRIPT%" not found!
    exit /b 1
)

:: Ensure PyInstaller is installed
where pyinstaller >nul 2>&1 || (
    echo PyInstaller not found. Installing...
    pip install pyinstaller || (
        echo [ERROR] Failed to install PyInstaller.
        exit /b 1
    )
)

:: Clean up previous build artifacts
rd /s /q build dist >nul 2>&1
del "%NAME%.spec" 2>nul

:: Build the standalone executable
echo Building "%NAME%.exe" from "%SCRIPT%"...
pyinstaller --onefile --name "%NAME%" %ICON% %EXTRA% "%SCRIPT%"
if errorlevel 1 (
    echo [ERROR] Build failed.
    exit /b 1
)

echo.
echo [SUCCESS] Executable created: dist\%NAME%.exe
endlocal
pause