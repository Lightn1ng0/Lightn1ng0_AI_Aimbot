@echo off
setlocal

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if %errorlevel% neq 0 (
    echo [31mPlease run this script as administrator[0m
    pause
    exit /b
)

set "INSTALL_LOCATION=%appdata%\Lightn1ng0_AI_Aimbot"
set "RELEASE_ZIP=%INSTALL_LOCATION%\Lightn1ng0_AI_Aimbot_Release-1.2.zip"
set "CUDA_INSTALLER=%INSTALL_LOCATION%\Dependencies\cuda_12.4.1_551.78_windows.exe"
set "PYTHON_INSTALLER=%INSTALL_LOCATION%\Dependencies\python-3.11.7-amd64.exe"
set "CUDNN_INSTALLER=%INSTALL_LOCATION%\Dependencies\cudnn_9.1.1_windows.exe"
set "TENSORRT_ZIP=%INSTALL_LOCATION%\Dependencies\TensorRT-10.0.1.6.Windows10.win10.cuda-12.4.zip"

if not exist "%INSTALL_LOCATION%" (
    mkdir "%INSTALL_LOCATION%"
)

if not exist "%RELEASE_ZIP%" (
    echo Downloading latest release...
    curl -o %RELEASE_ZIP% -L -# https://github.com/Lightn1ng0/Lightn1ng0_AI_Aimbot/releases/download/1.2/Lightn1ng_AI_Aimbot_Release-1.2.zip
)

if exist "%INSTALL_LOCATION%\Lightn1ng0_AI_Aimbot" (
    rmdir %INSTALL_LOCATION%\Lightn1ng0_AI_Aimbot /s /q
)

powershell -Command "$ProgressPreference = 'SilentlyContinue'; Expand-Archive -Path "%RELEASE_ZIP%" -DestinationPath "%INSTALL_LOCATION%"" > nul

echo [92mChecking if your system has an NVIDIA graphics card...[0m
set "GPU_OUTPUT="
for /f "delims=" %%i in ('powershell -Command "Get-WmiObject -Class Win32_VideoController | Where-Object { $_.Name -like '*NVIDIA*' }"') do set "GPU_OUTPUT=%%i"

if defined GPU_OUTPUT (
    echo [32mNVIDIA graphics card detected.[0m
    nvcc --version >nul 2>&1
    if %errorlevel% neq 0 (
        if exist "%CUDA_INSTALLER%" (
            echo [92mCUDA installer already exists. Skipping download.[0m
        ) else (
            echo [92mDownloading CUDA Toolkit 12.4.1...[0m
            curl -o "%CUDA_INSTALLER%" -# https://developer.download.nvidia.com/compute/cuda/12.4.1/local_installers/cuda_12.4.1_551.78_windows.exe
        )
        echo [32mInstalling CUDA Toolkit 12.4.1...[0m
        "%CUDA_INSTALLER%" -s
    ) else (
        echo [92mCUDA is already installed. Skipping install...[0m
    )
) else (
    echo [32mNo NVIDIA graphics card detected.[0m
)

set PYTHON_INSTALL_PATH=%localappdata%\Programs\Python\Python311
set PATH=%PYTHON_INSTALL_PATH%;%PYTHON_INSTALL_PATH%\Scripts;%PATH%

python --version >nul 2>&1

if %errorlevel% neq 0 (
    if exist "%PYTHON_INSTALLER%" (
        echo [94mPython installer already exists. Skipping download.[0m
    ) else (
        echo [94mDownloading Python...[0m
        curl -o "%PYTHON_INSTALLER%" -# https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe
    )
    echo [34mInstalling Python...[0m
    "%PYTHON_INSTALLER%" /quiet PrependPath=1

    echo [33mVerifying Python installation...[0m
    python --version
    echo [33mPython installation complete.[0m
) else (
    echo [94mPython is already installed. Skipping install...[0m
)

python -m pip install --upgrade pip
pip install --upgrade setuptools

set "VENV_DIR=%INSTALL_LOCATION%\venv"

echo [35mCreating a Python virtual environment in the directory: %VENV_DIR%[0m
python -m venv %VENV_DIR%

if exist %VENV_DIR%\Scripts\activate.bat (
    echo [95mVirtual environment created successfully.[0m
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
    echo [31mFailed to create the virtual environment.[0m
    pause
    exit /b 1
)

echo [34mInstalling Python Pip Packages%...[0m
python -m pip install --upgrade pip
pip install --upgrade setuptools
pip install -r "%INSTALL_LOCATION%\Dependencies\requirements.txt"

if defined GPU_OUTPUT (
    pip install cupy-cuda12x
    pip install onnxruntime-gpu --extra-index-url https://aiinfra.pkgs.visualstudio.com/PublicPackages/_packaging/onnxruntime-cuda-12/pypi/simple/
    pip uninstall torch torchvision torchaudio -y
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
) else (
    pip install onnxruntime-directml
)

if defined GPU_OUTPUT (
    set CUDA_PATH="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4"

    if exist "%CUDNN_INSTALLER%" (
        echo [92mCUDNN installer already exists. Skipping download.[0m
    ) else (
        echo [92mDownloading CUDNN 9.1.1...[0m
        curl -o "%CUDNN_INSTALLER%" -# https://developer.download.nvidia.com/compute/cudnn/9.1.1/local_installers/cudnn_9.1.1_windows.exe
    )

    echo [32mInstalling CUDNN 9.1.1...[0m
    "%CUDNN_INSTALLER%" -s

    if exist "%TENSORRT_ZIP%" (
        echo [92mTensorRT installer already exists. Skipping download.[0m
    ) else (
        echo [92mDownloading TensorRT 10.0.1.6...[0m
        curl -o "%TENSORRT_ZIP%" -L -# https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/10.0.1/zip/TensorRT-10.0.1.6.Windows10.win10.cuda-12.4.zip
    )
    
    echo [32mInstalling TensorRT 10.0.1.6...[0m
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; Expand-Archive -Path "%TENSORRT_ZIP%" -DestinationPath "%INSTALLATION_PATH%\Dependencies"" > nul
    python "%INSTALLATION_PATH%\Dependencies\copy.py"
    pip install "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v12.4/python/tensorrt-10.0.1-cp311-none-win_amd64.whl"
)

echo [95mLightn1ng0 AI Aimbot is installed!...[0m
endlocal
pause
