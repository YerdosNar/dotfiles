#!/bin/bash

# FCitx5 status script for Waybar
# Save this as ~/.config/waybar/scripts/fcitx5-status.sh and make it executable

# Get current input method from fcitx5
current_im=$(fcitx5-remote -n 2>/dev/null)

# Map input method names to display labels
case "$current_im" in
    "keyboard-us")
        echo "EN"
        ;;
    "hangul")
        echo "KO"
        ;;
    "fcitx-keyboard-ru")
        echo "RU"
        ;;
    *)
        # Fallback: try to extract language code from input method name
        if [[ "$current_im" =~ keyboard-([a-z]{2}) ]]; then
            echo "${BASH_REMATCH[1]^^}"
        else
            echo "EN"
        fi
        ;;
esac
