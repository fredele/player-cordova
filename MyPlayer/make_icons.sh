#!/bin/bash

# Usage: ./make_icons.sh source.png
# Exemple: ./make_icons.sh icon.png

set -e

SRC="$1"
if [[ -z "$SRC" ]]; then
  echo "Usage: $0 <source-image>"
  exit 1
fi

if ! command -v convert >/dev/null 2>&1; then
  echo "Erreur : imagemagick n'est pas installé (commande 'convert' introuvable)."
  echo "Installe-le, par ex. sous Debian/Ubuntu : sudo apt install imagemagick"
  exit 2
fi

if [[ ! -f "$SRC" ]]; then
  echo "Erreur : fichier source '$SRC' introuvable."
  exit 3
fi

# Base path vers les ressources Android (adapte si besoin)
BASE_RES="platforms/android/app/src/main/res"

# Map densities -> size (launcher legacy icons)
declare -A SIZES=(
  [mipmap-ldpi]=36
  [mipmap-mdpi]=48
  [mipmap-hdpi]=72
  [mipmap-xhdpi]=96
  [mipmap-xxhdpi]=144
  [mipmap-xxxhdpi]=192
)

for D in "${!SIZES[@]}"; do
  SIZE=${SIZES[$D]}
  DEST_DIR="$BASE_RES/$D"
  mkdir -p "$DEST_DIR"
  OUT="$DEST_DIR/ic_launcher.png"
  echo "Génération de $OUT (${SIZE}x${SIZE})"
  convert "$SRC" -resize "${SIZE}x${SIZE}" -background none -gravity center -extent "${SIZE}x${SIZE}" "$OUT"
done

echo "Terminé. Vérifie que ton AndroidManifest.xml utilise :"
echo "  android:icon=\"@mipmap/ic_launcher\""
echo "  android:roundIcon=\"@mipmap/ic_launcher\""
echo "Et rebuild : cordova clean android && cordova build android"

