#!/bin/bash
# Construire l'application Electron
cordova build electron --release
# Supprimer l' ancien répertoire de l'archive build décompressée
rm -r ./platforms/electron/build/com.player-1.0.0/
# Se placer dans le dossier de build
cd ./platforms/electron/build/
# Décompresse et copie les fichiers
tar -xzf com.player-1.0.0.tar.gz && cp -r appimage/* com.player-1.0.0/
cd ..
cd ..
cd ..
# Construit l'image
/mnt/Disque_2/.Applications/appimagetool-x86_64.AppImage ./platforms/electron/build/com.player-1.0.0/ ./platforms/electron/build/Player.AppImage
# Remplace l'image
rm  /mnt/Disque_2/.Applications/Player.AppImage
mv ./platforms/electron/build/Player.AppImage  /mnt/Disque_2/.Applications/Player.AppImage
