#!/bin/bash

# Usage
if [ -z "$1" -o -z "$2" ]; then
	echo "Usage: `basename $0` [path/to/wallpaper] [theme_name]"
	echo
	exit 0
fi

# Check if wallpaper exists
if [ ! -f "$1" ]; then
	echo "`basename $0`: $1 doesn't exist"
	echo
fi


WAL_CACHE="$HOME/.cache/wal"

# Waybar
WAYBAR_PATH="$HOME/.config/waybar"
[ ! -d "$WAYBAR_PATH/themes/$2" ] && mkdir -p "$WAYBAR_PATH/themes/$2"

# Generate colors and load
wal -i "$1" -nstq
source "$WAL_CACHE/colors.sh"

cat > "$WAYBAR_PATH/themes/$2/waybar_colors.css" << EOF
@define-color color_bg_transp \
	$(echo ${color0:1} | \
	awk '{print "ibase=16;"toupper(substr($0,1,2))";" toupper(substr($0,3,2))";" toupper(substr($0,5,2))}' | bc | \
	xargs echo | awk '{print "rgba ("$1", " $2", " $3 ", 0.8)" }');

@define-color color_bg $color0;
@define-color color_primary $color1;
@define-color color_secondary $color2;
@define-color color_secondary_alt $color3;
@define-color color_info $color4;
@define-color color_highlight $color5;
@define-color color_text_muted $color6;
@define-color color_text $color7;
@define-color color_bg_alt $color8;
@define-color color1 $color9;
@define-color color2 $color10;
@define-color color3 $color11;
@define-color color4 $color12;
@define-color color5 $color13;
@define-color color6 $color14;
@define-color color7 $color15;
EOF

