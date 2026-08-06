#!/bin/bash

cordova build android --release -- --keystore=/home/fredele/MyPlayer/cordova_app/MyPlayer/Player.keystore --storePassword=password --alias=Player --password=password --packageType=apk

#python3 /home/fredele/.Applications/send_to_ftp.py /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/android/app/build/outputs/apk/release/app-release.apk
