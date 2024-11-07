@echo off
setlocal
REM Set the repository path (edit this if needed)
set REPO_PATH=C:\Users\hellovertex\Documents\github.com\hellovertex\dotfiles\nvim


REM Set the Neovim config path
set NVIM_CONFIG_PATH=C:\Users\hellovertex\AppData\Local\nvim

REM Check if the nvim directory already exists
if exist "%NVIM_CONFIG_PATH%" (
    echo Deleting existing nvim directory at %NVIM_CONFIG_PATH%
    rmdir /S /Q "%NVIM_CONFIG_PATH%"
)

REM Create a symlink for the nvim config
echo Creating symlink for Neovim config from %REPO_PATH% to %NVIM_CONFIG_PATH%
mklink /D "%NVIM_CONFIG_PATH%" "%REPO_PATH%"

REM Check if the symlink creation was successful
if %errorlevel% equ 0 (
    echo Symlink created successfully!
) else (
    echo Failed to create symlink. Make sure to run this script as Administrator.
)

endlocal
pause