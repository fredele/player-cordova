#!/bin/bash

cordova build electron --release
rm -r /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/com.player-1.0.0/
cd /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/
tar -xzf com.player-1.0.0.tar.gz && cp -r appimage/* com.player-1.0.0/
/mnt/Disque_2/.Applications/appimagetool-x86_64.AppImage /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/com.player-1.0.0/ /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/Player.AppImage
rm /mnt/Disque_2/.Applications/Player.AppImage
mv /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/Player.AppImage  /mnt/Disque_2/.Applications/Player.AppImage
