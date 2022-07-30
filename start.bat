@echo off
:MIT License
:
:Copyright (c) 2022 p051x_m374
:
:Permission is hereby granted, free of charge, to any person obtaining a copy
:of this software and associated documentation files (the "Software"), to deal
:in the Software without restriction, including without limitation the rights
:to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
:copies of the Software, and to permit persons to whom the Software is
:furnished to do so, subject to the following conditions:
:
:The above copyright notice and this permission notice shall be included in all
:copies or substantial portions of the Software.
:
:THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
:IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
:FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
:AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
:LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
:OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
:SOFTWARE.

@echo off
:start
echo ####################################################################
echo #        Priming Rust Server (Press any button to start)           #
echo ####################################################################
pause
cls
echo ####################################################################
echo #         Updating Rust Dedicated Server via SteamCMD              #
echo ####################################################################
cd steam
steamcmd.exe +runscript ../update_script.txt
cd ..
cls
echo ####################################################################
echo #                         Updating Oxide                           #
echo ####################################################################
set url=https://umod.org/games/rust/download?tag=public
set file=Oxide.zip
certutil -urlcache -split -f %url% %file%

tar -xf "D:\steamcmd\Oxide.zip" -C "D:\steamcmd\rustds" 
del "Oxide.zip"
cls

echo ####################################################################
echo #               Starting RUST Server in 2 seconds                  #
echo ####################################################################
timeout /t 2 /nobreak >nul
cd rustds
RustDedicated.exe -batchmode -autoupdate +server.ip 0.0.0.0 +server.port 28888 +rcon.port 28887 +rcon.ip 0.0.0.0 +rcon.password "CHANGEME" +rcon.web 1 +server.headerimage "http://yourwebsite.com/serverimage.jpg" +server.identity "p051x_m374" +server.maxplayers 500 +server.url "p051x_m374" +server.hostname "p051x_m374" +server.level "Procedural Map" +server.tickrate 10 +server.seed 6738 +server.worldsize 4000 +server.saveinterval 30 +server.globalchat true +server.secure true +server.official true +server.description "Powered by Eyerise. This is a mirage.."
cd ../

goto start
