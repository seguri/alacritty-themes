#!/usr/bin/env bash

set -euo pipefail

LIGHT_THEME="$HOME/Documents/alacritty-themes/themes/Brewer.light.toml"
DARK_THEME="$HOME/Documents/alacritty-themes/themes/Brewer.dark.toml"
DST="$HOME/.config/alacritty/active_theme.toml"

if [[ $(dark-mode status) == on ]]; then
    cp "$DARK_THEME" "$DST"
else
    cp "$LIGHT_THEME" "$DST"
fi
