

# Installation 

### Versions des logiciels utilisés

node -v
v22.16.0

npm -v
10.9.2

java -version
openjdk version "17.0.15" 2025-04-15

cordova -v
13.0.0



## Cordova

Installer l' application par défaut :

```
cordova create myApp
cd myApp
cordova platform add android
cordova-res android --icon
cordova build android
adb install /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/android/app/build/outputs/apk/debug/app-debug.apk
cordova build android --release -- --packageType=apk

## Pour un apk signé ...

keytool -genkey -v -keystore Player.keystore -alias Player -keyalg RSA -keysize 2048 -validity 10000
cordova build android --release -- --keystore=/home/fredele/MyPlayer/cordova_app/MyPlayer/Player.keystore --storePassword=password --alias=Player --password=password --packageType=apk
adb install /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/android/app/build/outputs/apk/release/app-release.apk
```

### Commandes utiles

cordova run electron --release
cordova run electron --nobuild --release
cordova run electron --nobuild

### Masquer la barre de menu

Dans le fichier des préférences, dans le dossier res.

## Plugins

https://github.com/jlorente/cordova-plugin-volume-control : marche pour iOS et Android.

# Refaire l'application

Remettre les fichiers du repo. dans celui de l'app. par défaut.  Le .gitignore rensigne sur les dossiers abscent du repo regénérés par l'app. par défaut.

# Faire une image AppImage

Dans le dossier `/home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/` , décompressez l' archive et copier les fichiers dans le dossier appimage à l'intérieur. Il s' agit des fichiers AppRun, .desktop et l' image ...

```
tar -xzf com.player-1.0.0.tar.gz && cp -r appimage/* com.player-1.0.0/
```

Lancer la commande pour compiler :

```
/home/fredele/.Applications/appimagetool-x86_64.AppImage /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/com.player-1.0.0/ /home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/electron/build/Player.AppImage
```

Pour compacter tout cela ...



## Changer l' icône

en utilisant le script pour les générer ... et les mettres dans le dossier :

`/home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/android/app/src/main/res/`

Editer le Manifest dans :

`/home/fredele/MyPlayer/cordova_app/MyPlayer/platforms/android/app/src/main/`

pour icon et roundedIcon ...



