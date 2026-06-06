@echo off
cd /d "%~dp0"

:: Re-launch as Administrator if not already elevated
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process cmd '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

call .venv\Scripts\activate.bat
python E7SecretShopRefresh.py
pause
