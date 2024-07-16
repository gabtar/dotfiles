#!/bin/bash
WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", "");print}' | tofi -c ~/.config/tofi/windowswitcher)
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow $WINDOW
