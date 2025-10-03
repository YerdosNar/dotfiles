#!/usr/bin/env bash

# Define the options for Rofi
options="⏻ Power Off\n󰜉 Reboot\n󰒲 Sleep\n Lock"

# Get the user's choice
chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -i)

# Execute the command based on the choice
case "$chosen" in
    "⏻ Power Off")
        systemctl poweroff ;;
    "󰜉 Reboot")
        systemctl reboot ;;
    "󰒲 Sleep")
        systemctl suspend ;;
    " Lock")
        swaylock ;; # Make sure you have swaylock installed
esac
