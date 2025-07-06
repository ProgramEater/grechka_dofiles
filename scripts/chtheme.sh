#!/bin/bash

# Usage
if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
	echo "Usage: `basename $0` [options] [name of the theme] [(optional) path/to/wallpaper]"
	echo
	echo "[options]:"
	echo "	-h --help 	show this message"
	echo "	-o --override 	override the theme completely including waybar colors, hyprland colors and wallpaper (no prompt)"
	echo
	echo "If the theme exists - will switch to it (and use wallpaper if provided); otherwise provide the [path/to/wallpaper] to automatically generate new colors for the theme and set wallpaper"
	exit 0
fi

if [ "$1" = "-o" -o "$1" = "--override" ]; then
	shift # $1 - theme;	$2 - wallpaper
	
	# check if wallpaper exists
	echo "`basename $0`: removing existing themes with name \"$1\""
	[ -z "$2" -o ! -f "$2" ] && { echo "No viable wallpaper provided ($2 - doesn't exist). Can't override."; exit 0; }

	[ -d "$HOME/.config/hypr/themes/$1" ] && rm -d -r "$HOME/.config/hypr/themes/$1"
	[ -d "$HOME/.config/waybar/themes/$1" ] && rm -d -r "$HOME/.config/waybar/themes/$1"
fi

~/.config/hypr/scripts/chtheme_hypr.sh "$1" "$2"
[ ! $? -eq 0 ] && { echo "`basename $0`: couldn't change hypr theme. Exiting..."; exit 1; }
~/.config/waybar/scripts/chtheme_waybar.sh "$1" "$2"
