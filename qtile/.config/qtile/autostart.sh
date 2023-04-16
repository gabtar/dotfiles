#!/bin/sh
feh --bg-scale ~/.config/qtile/wallpaper/mountain.jpg
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

udiskie -t

# Disable notebook Touchpad
xinput --disable $(xinput -list | grep "Touchpad" | grep -Eo "id=[0-9]+" | grep -Eo "[0-9]+")

