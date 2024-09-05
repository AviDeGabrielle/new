@echo off

set PROTOCOL=%1
set REPO=%2
set DEST=%3

if exist %DEST% goto :dir_exists

call git clone "%PROTOCOL%%REPO%.git" %DEST%

if not exist %DEST% goto :clone_failed

cd %DEST%

rd /s /q .git

goto :exit

:dir_exists

echo "Directory %DEST% already exists. Choose a different name."

exit /b 1

:clone_failed

echo "Cloning %REPO% failed."

exit /b 1

:exit
