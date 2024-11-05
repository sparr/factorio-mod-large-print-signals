#!/bin/bash

CHARS=ABCDEFGHIJKLMNOPQRTSUVWXYZ0123456789

if { ! command -v convert >/dev/null; } 2>&1
then
    echo "This script requires the imagemagick `convert` tool."
    exit 1
fi

for (( i=0; i<${#CHARS}; i++ )); do
    file="graphics/icons/signal/signal_${CHARS:$i:1}.png"
    convert -size 120x64 xc:transparent \
        -fill black -draw "roundRectangle 0,0,63,63 8,8" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 72 -gravity center -annotate -26-2 ${CHARS:$i:1} \
        -fill black -draw "roundRectangle 64,0,95,31 4,4" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 36 -gravity center -annotate +21-17 ${CHARS:$i:1} \
        -fill black -draw "roundRectangle 96,0,111,15 2,2" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 18 -gravity center -annotate +45-24.5 ${CHARS:$i:1} \
        -fill black -draw "roundRectangle 112,0,119,7 1,1" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 9 -gravity center -annotate +56.5-28.25 ${CHARS:$i:1} \
        "$file"
    if { command -v ect >/dev/null; } 2>&1
    then
        ect -9 "$file"
    elif { command -v oxipng >/dev/null; } 2>&1
    then
        oxipng -o 6 "$file"
    elif { command -v optipng >/dev/null; } 2>&1
    then
        optipng -o7 "$file"
    fi
done