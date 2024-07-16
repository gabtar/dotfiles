#!/bin/env bash

# Options for powermenu
logout=" 󰍃 Logout "
shutdown="  Shutdown "
reboot=" 󰜉 Reboot "
sleep="  Suspend "

# Get user response from tofi
selected_option=$(echo "$logout
$reboot
$shutdown
$sleep" | tofi -c ~/.config/tofi/powerconfig)

echo $selected_option

# Do something based on selected option
if [ "$selected_option" == "$logout" ]
then
    loginctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    amixer set Master mute
    systemctl suspend
else
    echo "No match"
fi
