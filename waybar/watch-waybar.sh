#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
CONFIG_FILES=("$CONFIG_DIR/config" "$CONFIG_DIR/style.css")

echo "Watching for changes in Waybar config..."

inotifywait -m -e modify "${CONFIG_FILES[@]}" |
while read -r filename event; do
    echo "Change detected in $filename, reloading Waybar..."
    pkill waybar && waybar &
done

