#!/bin/bash

THEME_PATH="$HOME/.config/hypr/themes/"

# Check amount of arguments
if [ -z "$1" -o $# -gt 2 ]; then
	echo "Usage `basename $0`: first argument should be path to existing wallpaper"
	echo "optionally, second parameter may be a string without spaces - name of the theme to add the wallpaper to"
	echo "Note that if the theme exists, the wallpaper would be rewritten"
	echo
	exit 0
fi

# check if wallpaper exists
if [ ! -f "$1" ]; then
	echo "`basename $0`: $1 doesn't exist"
	echo
else
	sed -i -e "s|\$WALLPAPER *=.*|\$WALLPAPER = \"$1\"|" "$HOME/.config/hypr/theme.conf"
	sed -i -e "s|preload *=.*|preload = $1|" "$HOME/.config/hypr/hyprpaper.conf"
	sed -i -e "s|wallpaper *=.*|wallpaper = ,$1|" "$HOME/.config/hypr/hyprpaper.conf"
fi

if [ -n "$2" ]; then
	if [ -d "$THEME_PATH/$2" ]; then
		read -p "theme exists, overwrite wallpaper? Y/n " -n 1 -r
		echo
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 0;
		fi
	else 
		mkdir "$THEME_PATH/$2"
	fi
	echo "$1" > "$THEME_PATH/$2/wallpaper"
fi

# to sync hyprland
sleep 0.3
hyprctl hyprpaper reload ,"$1"
