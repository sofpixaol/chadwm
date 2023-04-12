#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --randomize --bg-fill ~/Pictures/wallpaper/*.png &
xset r rate 200 50 &
picom --experimental-backends --config ~/scripts/config/picom.conf >> /dev/null 2>&1 &

~/.config/chadwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
