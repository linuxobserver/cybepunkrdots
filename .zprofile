#!/bin/zsh

 PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/.local/bin; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

# Show/Hide hidden files on open.
# (Off by default)
export FFF_HIDDEN=1
export FFF_OPENER="opener"
# Favourites (Bookmarks) (keys 1-9) (dir or file)
export FFF_FAV1=~/
export FFF_FAV2=~/Documents/
export FFF_FAV3=~/Pictures/
export FFF_FAV4=~/Music/
export FFF_FAV5=~/Downloads/
export FFF_FAV6=/mnt/
export FFF_FAV7=~/.bashrc
export FFF_FAV8=~/.config/sway/config
export FFF_FAV9=~/.config/waybar/config

# File format.
# Customize the item string.
# Format ('%f' is the current file): "str%fstr"
# Example (Add a tab before files): FFF_FILE_FORMAT="\t%f"
export FFF_FILE_FORMAT="%f"

# Mark format.
# Customize the marked item string.
# Format ('%f' is the current file): "str%fstr"
# Example (Add a ' >' before files): FFF_MARK_FORMAT="> %f"
export FFF_MARK_FORMAT=" %f*"

# Default programs:
export EDITOR="nvim"
export TERMINAL="footclient"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export QT_QPA_PLATFORMTHEME=gtk2
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s wayland >/dev/null 2>&1 && exec sway >/dev/null 2>&1
