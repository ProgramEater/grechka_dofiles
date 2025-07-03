#!/bin/bash

# Usage
if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
	echo "Usage: `basename $0` [name of the theme] [(optional) path/to/wallpaper]"
	echo
	echo "If the theme exists - will switch to it (and use wallpaper if provided); otherwise provide the [path/to/wallpaper] to automatically generate new colors for the theme and set wallpaper"
	exit 0
fi


HYPR_PATH="$HOME/.config/hypr"
THEMES_PATH="$HYPR_PATH/themes"
THEME_CONF="$HYPR_PATH/theme.conf"

if [ ! -d "$THEMES_PATH/$1" ]; then
	# theme does not exist => generate a new one
	
	# check if provided wallpaper exists
	[ -z "$2" ] && { echo "$1 doesn't exist therefore wallpaper can't be null"; exit 0; }
	[ ! -f "$2" ] && { echo "$2 doesn't exist"; exit 0; }
	
	# generate colors and add wallpaper to the theme
	$HYPR_PATH/scripts/generate_colors.sh "$2" "$1"
	echo "$2" > "$THEMES_PATH/$1/wallpaper"
fi

# change the $THEME in theme.conf	
sed -i -e "s|\$THEME *=.*|\$THEME = $THEMES_PATH/$1|" "$THEME_CONF"

# if wallpaper is set on the theme - set wallpaper	
if [ -f "$THEMES_PATH/$1/wallpaper" ]; then
	exec $HYPR_PATH/scripts/chwallpaper.sh "$(cat "$THEMES_PATH/$1/wallpaper")" 
fi

# if other wallpaper is provided in $2
if [ -n "$2" -a -f "$2" ]; then
	$HYPR_PATH/scripts/chwallpaper.sh "$2"
elif [ -n "$2" ]; then
	echo "$2 doesn't exist"
fi

# reload the config
hyprctl reload
exit 0
