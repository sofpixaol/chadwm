#!/bin/sh

xrdb merge ~/.Xresources
feh --randomize --bg-fill ~/Pictures/wallpaper/*.png &
xset r rate 200 50 &
picom --experimental-backends --config ~/.config/chadwm/scripts/picom.conf >> /dev/null 2>&1 &

~/.config/chadwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
