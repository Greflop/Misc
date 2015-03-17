@echo off

:Selection
title Wi-Fi Hotspot controller

set "Opt[1]=Start"
set "Opt[2]=Stop"
set "Opt[3]=Restart"
set "Opt[4]=Quit"

set "Message="
:Menu
cls
echo.%Message%
echo.
echo. Wi-Fi hotspot
echo.
set "x=0"
:MenuLoop
set /a "x+=1"
if defined Opt[%x%] (
    call echo   %x%. %%Opt[%x%]%%
    goto MenuLoop
)
echo.

:Prompt
set "Input="
set /p "Input=Select action: "

:Condition
if %Input% EQU 1 goto Start
if %Input% EQU 2 goto Stop
if %Input% EQU 3 goto Restart
if %Input% EQU 4 goto Quit

:Start
echo(
echo Starting the Wi-Fi hotspot...
echo(
netsh wlan start hostednetwork
pause
goto Selection

:Stop
echo(
echo Stopping the Wi-Fi hotspot...
echo(
netsh wlan stop hostednetwork
pause
goto Selection

:Restart
echo(
echo Restarting the Wi-Fi hotspot...
echo(
netsh wlan stop hostednetwork
netsh wlan start hostednetwork
pause
goto Selection

:Quit
echo(
echo Exiting this script will not stop the Wi-Fi hotspot.
echo(
pause
exit