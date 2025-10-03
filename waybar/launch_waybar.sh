#!/usr/bin/env bash
if pgrep -x Hyprland >/dev/null; then
    waybar -c ~/.config/waybar/config_hyprland.jsonc -s ~/.config/waybar/style.css
else
    waybar -c ~/.config/waybar/config_sway.jsonc -s ~/.config/waybar/style.css
fi

