#!/opt/homebrew/bin/bash

set -eu

toggle-theme-stdout.sh "$(dark-mode status)" > ~/.config/alacritty/alacritty.toml

