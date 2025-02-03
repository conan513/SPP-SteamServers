@echo off
set mainfolder=%CD%

:menu
echo #######################################################
echo # Single Player Project - Steam Servers
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo 1 - Conan Exiles
echo 2 - Don't Starve Together
echo 3 - 7 Days To Die
echo 4 - Counter-Strike Global Offensive
echo 5 - Rust
echo 6 - Team Fortress 2
echo 7 - Barotrauma
echo 8 - SCP: Secret Laboratory
echo 9 - Project Zomboid
echo.
set /P gameselect=Enter a number: 
if "%gameselect%"=="1" (goto menu_conanexiles)
if "%gameselect%"=="2" (goto menu_dontstarve)
if "%gameselect%"=="3" (goto menu_7daystodie)
if "%gameselect%"=="4" (goto menu_csgo)
if "%gameselect%"=="5" (goto menu_rust)
if "%gameselect%"=="6" (goto menu_tf2)
if "%gameselect%"=="7" (goto menu_barotrauma)
if "%gameselect%"=="8" (goto menu_secretlab)
if "%gameselect%"=="9" (goto menu_zomboid)
if "%gameselect%"=="" (goto menu)


REM ------------------------------------------------------------------------------------------------------------------------------

:menu_conanexiles
set appid=443030
set gamename=Conan Exiles
set gamefolder=Conan Exiles Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls

REM -------- CONAN EXILES SETTINGS HERE -------- 

set servername=Single Player Project
set password=
set adminpassword=123456
set maxplayers=10
set tickrate=30
set MaxPlayers=10
set nudity=2
set blitzmode=False
set pvp=True
set battleye=True

REM -------- CONAN EXILES SETTINGS HERE -------- 

echo #######################################################
echo # Single Player Project - %gamename% 
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo ----------- SERVER SETTINGS -----------
echo.
echo Name           = %servername%
echo Password       = %password%
echo Admin password = %adminpassword%
echo Max players    = %maxplayers%
echo TickRate       = %tickrate%
echo Nudity         = %nudity%
echo Blitz mode     = %blitzmode%
echo PVP            = %pvp%
echo BattlEye       = %battleye%
echo.
echo ----------- SERVER SETTINGS -----------
echo.
echo 1 - Start the server
echo 2 - Edit server settings
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_conanexiles)
if "%menu%"=="2" (goto edit_conanexiles)
if "%menu%"=="" (goto menu)

:start_conanexiles
cls
echo.
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
ConanSandboxServer.exe -log -nosteam -ServerName=%servername% -ServerPassword=%password% -NetServerMaxTickRate=%tickrate% -MaxPlayers=%maxplayers% -AdminPassword=%adminpassword% -MaxNudity=%nudity% -PVPBlitzServer=%blitzmode% -PVPEnabled=%pvp% -IsBattlEyeEnabled=%battleye%
exit

:edit_conanexiles
start notepad.exe "%mainfolder%\Launcher.bat"
exit

REM ------------------------------------------------------------------------------------------------------------------------------

:menu_dontstarve
set appid=343050
set gamename=Don't Starve Together
set gamefolder=Don't Starve Together Dedicated Server

IF NOT EXIST "%mainfolder%\dontstarvelan.on" (
  IF NOT EXIST "%mainfolder%\dontstarvelan.off" (
    echo autosave > "%mainfolder%\dontstarvelan.on"
  )
)
if exist "%mainfolder%\dontstarvelan.on" set dontstarvelan=ON
if exist "%mainfolder%\dontstarvelan.off" set dontstarvelan=OFF
if exist "%mainfolder%\dontstarvelan.on" set dontstarvelanswitch=-lan
if exist "%mainfolder%\dontstarvelan.off" set dontstarvelanswitch=

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls

echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo Start the game or the server before try to change the settings.
echo.
echo 1 - Start the server
echo 2 - Edit server settings
echo.
echo 3 - LAN MODE (%dontstarvelan%)
echo 4 - Open dedicated server description page
echo.
echo The server can't start without a Server Token if LAN MODE is OFF.
echo Check the dedicated server description page for more information.
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_dontstarve)
if "%menu%"=="2" (goto edit_dontstarve)
if "%menu%"=="3" (goto dontstarvelan_switch)
if "%menu%"=="4" (start https://forums.kleientertainment.com/forums/topic/64212-dedicated-server-quick-setup-guide-windows)
if "%menu%"=="" (goto menu)

:dontstarvelan_switch
if exist "%mainfolder%\dontstarvelan.on" goto dontstarvelan_off
if exist "%mainfolder%\dontstarvelan.off" goto dontstarvelan_on

:dontstarvelan_off
cls
del "%mainfolder%\dontstarvelan.on"
echo dontstarvelan > "%mainfolder%\dontstarvelan.off"
goto menu_dontstarve

:dontstarvelan_on
del "%mainfolder%\dontstarvelan.off"
echo dontstarvelan > "%mainfolder%\dontstarvelan.on"
goto menu_dontstarve

:start_dontstarve
cls
echo.
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%\bin"
start "" dontstarve_dedicated_server_nullrenderer.exe -console %dontstarvelanswitch%
exit

:edit_dontstarve
if exist "%USERPROFILE%\OneDrive\Documents\Klei\DoNotStarveTogether\settings.ini" (notepad "%USERPROFILE%\OneDrive\Documents\Klei\DoNotStarveTogether\settings.ini")
if exist "%USERPROFILE%\Documents\Klei\DoNotStarveTogether\settings.ini" (notepad "%USERPROFILE%\OneDrive\Documents\Klei\DoNotStarveTogether\settings.ini")
goto menu_dontstarve

REM ------------------------------------------------------------------------------------------------------------------------------

:menu_7daystodie
set appid=294420
set gamename=7 Days To Die
set gamefolder=7 Days to Die Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls

echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo 1 - Start the server
echo 2 - Edit server settings
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_7daystodie)
if "%menu%"=="2" (goto edit_7daystodie)
if "%menu%"=="" (goto menu)

:start_7daystodie
cls
echo.
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start startdedicated.bat
cls
echo The server is running in the background.
echo Press any key if you want to close the server!
echo.
pause
taskkill /f /im 7DaysToDieServer.exe
exit

:edit_7daystodie
notepad "%mainfolder%\steamapps\common\%gamefolder%\serverconfig.xml"
goto menu_7daystodie

REM ------------------------------------------------------------------------------------------------------------------------------

:menu_csgo
set appid=740
set gamename=Counter-Strike Global Offensive
set gamefolder=Counter-Strike Global Offensive Beta - Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls
cd "%mainfolder%\steamapps\common\%gamefolder%"

echo ###########################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo ###########################################################
echo.
echo 1 - Start Classic Casual
echo 2 - Start Classic Competitive: 
echo 3 - Start Arms Race
echo 4 - Start Demolition
echo 5 - Start Deathmatch
echo.
echo 0 - Open wiki page
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (start "" srcds -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2)
if "%menu%"=="2" (start "" srcds -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_dust2)
if "%menu%"=="3" (start "" srcds -game csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map ar_shoots)
if "%menu%"=="4" (start "" srcds -game csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition +map de_lake)
if "%menu%"=="5" (start "" srcds -game csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic +map de_dust2)
if "%menu%"=="0" (start https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers)
if "%menu%"=="" (goto menu)
exit

REM ------------------------------------------------------------------------------------------------------------------------------

:menu_rust
set appid=258550
set gamename=Rust
set gamefolder=rust_dedicated

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls
cd "%mainfolder%\steamapps\common\%gamefolder%"


REM -------- RUST SETTINGS HERE -------- 

set servername=Single Player Project
set description=Description shown on server connection window.
set port=28015
set level=Procedural Map
set seed=1234
set worldsize=4000
set maxplayers=10
set serverurl=https://www.patreon.com/conan513
set server_identity=server1
set rcon_password=letmein

REM -------- RUST SETTINGS HERE -------- 


echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo ----------- SERVER SETTINGS -----------
echo.
echo Name        = %servername%
echo Description = %description%
echo Port        = %port%
echo Level       = %level%
echo Seed        = %seed%
echo Worldsize   = %worldsize%
echo Max players = %maxplayers%
echo Server URL  = %serverurl%
echo Identity    = %server_identity%
echo Rcon Pass   = %rcon_password%
echo.
echo ----------- SERVER SETTINGS -----------
echo.
echo Press F1 in the game main menu.
echo Enter this to connect to the local server:
echo client.connect 127.0.0.1:28015
echo.
echo 1 - Start the server
echo 2 - Edit server settings
echo.
echo 3 - Open wiki page
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_rust)
if "%menu%"=="2" (goto edit_conanexiles)
if "%menu%"=="3" (start https://developer.valvesoftware.com/wiki/Rust_Dedicated_Server)
if "%menu%"=="" (goto menu)

:start_rust 
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start "" RustDedicated.exe -batchmode +server.port %port% +server.level "%level%" +server.seed %seed% +server.worldsize %worldsize% +server.maxplayers %maxplayers% +server.hostname "%servername%" +server.description "%description%" +server.url "%serverurl%" +server.headerimage "http://yourwebsite.com/serverimage.jpg" +server.identity "%server_identity%" +rcon.port 28016 +rcon.password "%rcon_password%" +rcon.web 1
exit

REM ------------------------------------------------------------------------------------------------------------------------------

:menu_tf2
set appid=232250
set gamename=Team Fortress 2
set gamefolder=Team Fortress 2 Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls
echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo 1 - Start the server
echo 2 - Open wiki page
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_tf2)
if "%menu%"=="2" (start https://wiki.teamfortress.com/wiki/Windows_dedicated_server)
if "%menu%"=="" (goto menu)

:start_tf2 
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start "" srcds.exe -console -game tf +sv_pure 1 +map ctf_2fort +maxplayers 24
exit

:menu_barotrauma
set appid=1026340
set gamename=Barotrauma
set gamefolder=Barotrauma Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls
echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo 1 - Start the server
echo 2 - Open config file
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_barotrauma)
if "%menu%"=="2" (goto config_barotrauma)
if "%menu%"=="" (goto menu)

:config_barotrauma
cls
cd "%mainfolder%\steamapps\common\%gamefolder%"
if not exist "%mainfolder%\steamapps\common\%gamefolder%\serversettings.xml" goto no_firstrun_barotrauma
start "" serversettings.xml
goto menu_barotrauma

:no_firstrun_barotrauma
cls
echo Some config files missing.
echo Try to start the server once.
pause
goto menu_barotrauma

:start_barotrauma
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start "" DedicatedServer.exe
exit

:menu_secretlab
set appid=996560
set gamename=SCP: Secret Laboratory
set gamefolder=SCP Secret Laboratory Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls
echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo 1 - Start the server
echo 2 - Open config folder
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_secretlab)
if "%menu%"=="2" (goto config_secretlab)
if "%menu%"=="" (goto menu)

:config_secretlab
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start "" appdata.bat
goto menu_secretlab

:start_secretlab
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start "" LocalAdmin.exe
exit

:menu_zomboid
set appid=380870
set gamename=Project Zomboid
set gamefolder=Project Zomboid Dedicated Server

cls
echo.
echo Checking %gamename% server updates...
echo.
steamcmd.exe +login anonymous +app_update %appid% +quit
cls
echo #######################################################
echo # Single Player Project - %gamename%
echo # https://www.patreon.com/conan513
echo #######################################################
echo.
echo 1 - Start the server
echo 2 - Open config folder (run the server once to generate default config files)
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto start_zomboid)
if "%menu%"=="2" (goto config_zomboid)
if "%menu%"=="" (goto menu)

:config_zomboid
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
explorer.exe "%HOMEDRIVE%%HOMEPATH%\zomboid\server"
goto menu_zomboid

:start_zomboid
cls
echo Starting the %gamename% server...
echo Please wait...
echo.
cd "%mainfolder%\steamapps\common\%gamefolder%"
start "" StartServer64.bat
exit