@echo off
rem @echo off


setlocal enabledelayedexpansion

@echo Run this as you want, but to create in win directories, run this as admin
color 02

echo.
echo.


:drive
set /p _drive=Set drive you want to use: (C/D/Other) - 
if exist %_drive%: (
echo Ok, Current mount catalog is -
cd %_drive%: 
goto path ) 
if "%_drive%" == "" ( if "%_drive%" == "C" goto path
set "%_drive%" = "C"
echo Using default drive C
goto path )
if not exist %_drive%: ( 
cls
echo Select again, pls!
goto drive )


:path
echo.
set /p _path= Set pathname: (eg. Folder or Folder\AnotherOne) [leave this field blank to use root catalog] -
if "%_path%" == "" (
echo Ok, using root directory )
echo.


:name
set /p _name=Set filename: (eg text.txt) -
if "%_name%" == "" ( goto name )
echo.

:size
set /p _size=Set filesize: (in bytes) -
if "%_size%" == "" ( set %_size% = 128 )
echo.

:create
@echo creating file with path and name: %_path%\%_name% and size: %_size% bytes 
echo.
@echo Result:

echo.
if "%_path%" == "" set _full= %_drive%:\%_name%
else set _full= %_drive%:\%_path%\%_name%


IF NOT EXIST %_drive%:%_path% mkdir %_drive%:%_path%
rem If file is already exist, delete them
if exist %_full% (
echo removing old one.. 
del /f %_full% )

fsutil file createnew %_full% %_size%

pause
cls