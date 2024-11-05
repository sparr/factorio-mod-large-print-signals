#!/bin/bash

chars=ABCDEFGHIJKLMNOPQRTSUVWXYZ0123456789
for (( i=0; i<${#chars}; i++ )); do
    convert -size 120x64 xc:transparent \
        -fill black -draw "roundRectangle 0,0,63,63 8,8" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 72 -gravity center -annotate -26-2 ${chars:$i:1} \
        -fill black -draw "roundRectangle 64,0,95,31 4,4" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 36 -gravity center -annotate +21-17 ${chars:$i:1} \
        -fill black -draw "roundRectangle 96,0,111,15 2,2" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 18 -gravity center -annotate +45-24.5 ${chars:$i:1} \
        -fill black -draw "roundRectangle 112,0,119,7 1,1" \
        -fill white -font "Noto-Sans-Mono-Bold" -pointsize 9 -gravity center -annotate +56.5-28.25 ${chars:$i:1} \
        graphics/icons/signal/signal_${chars:$i:1}.png
done