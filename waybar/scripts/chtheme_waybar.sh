# waybar theme
# $1 - theme
# $2 - wallpaper if the theme doesn't exist

# Usage
if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
	echo "Usage: `basename $0` [theme name] [ (optional) path/to/wallpaper ]"
	exit 0
fi

if [ -n "$2" -a ! -f "$2" ]; then
	echo "`basename $0`: wallpaper $2 doesn't exist. Type `basename $0` -h for help"
	exit 0
fi
WAYBAR_PATH="$HOME/.config/waybar"
if [ ! -d "$WAYBAR_PATH/themes/$1" ]; then
	[ -z "$2" ] && { echo "`basename $0`: no theme and no wallpaper to create it. Exiting..."; exit 0; }
	# if wallpaper is provided then generate new waybar theme with colors
	$WAYBAR_PATH/scripts/generate_colors_waybar.sh "$2" "$1"
elif [ -n "$2" ]; then
	read -p "`basename $0`: waybar theme \"$1\" already exists, do you want to override it? [Y/n] " -n 1 -r
	echo
	[[ ! "$REPLY" =~ ^[Yy]$ ]] && exit 0
	$WAYBAR_PATH/scripts/generate_colors_waybar.sh "$2" "$1"
fi
sed -i -e "s|^@import \"themes/.*\"|@import \"themes/$1/waybar_colors.css\"|" "$WAYBAR_PATH/style.css"	

# reload the config
echo "`basename $0`: reloading waybar..."
killall waybar 2>/dev/null
sleep 0.3
hyprctl dispatch exec waybar
