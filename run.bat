@echo off

set "INSTALL_LOCATION=%appdata%\Lightn1ng0_AI_Aimbot"
set "VENV_DIR=%INSTALL_LOCATION%\venv"

if exist %VENV_DIR%\Scripts\activate.bat (
    echo [35mActivating the virtual environment...[0m
    call "%VENV_DIR%\Scripts\activate.bat"

    if %errorlevel% neq 0 (
        echo [31mFailed to activate the virtual environment.[0m
        pause
        exit /b 1
    ) else (
        echo [95mVirtual environment activated successfully.[0m
    )
) else (
    echo [31mNo virtual environment found, please run setup.bat[0m
    pause
    exit /b 1
)

python "%INSTALL_LOCATION%\Lightn1ng0_AI_Aimbot\main.py"
pause