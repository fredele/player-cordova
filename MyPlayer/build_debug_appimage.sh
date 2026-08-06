#!/bin/bash

cordova build electron 
rm -r ~/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/com.player-1.0.0/
cd ~/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/
tar -xzf com.player-1.0.0.tar.gz && cp -r appimage/* com.player-1.0.0/
~/.Applications/appimagetool-x86_64.AppImage ~/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/com.player-1.0.0/ ~/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/Player.AppImage
rm ~/.Applications/Player.AppImage
mv ~/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/Player.AppImage  ~/.Applications/Player.AppImage




