@echo off
setlocal enabledelayedexpansion

:: Change to the images directory
cd /d "%~dp0..\images"

:: Initialize counter
set count=0

:: Loop through image files and store them in an array
for %%f in (*.jpg *.jpeg *.png *.bmp *.gif) do (
    set /a count+=1
    set "file[!count!]=%%f"
)

:: Check if there are no image files
if %count%==0 (
    echo No image files found in the images directory.
    pause
    exit /b
)

:: Generate a random number between 1 and the number of image files
set /a "randomNum=%random% %% count + 1"

:: Open the randomly selected image file
start "" "!file[%randomNum%]!"