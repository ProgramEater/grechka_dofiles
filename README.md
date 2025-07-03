This is my first rice for Hyprland 0.49.0 and hyprpaper 0.7.5-1 (for now).

I am planning on adding wofi and waybar and some notification daemon in the future.

For now my rice has a basic hyprland config split into several parts - basic keybinds, autostart, layout, decorations and so on...

It also has 3 scripts, all aimed at changing wallpaper: 
    + generate colors based on an image and create a theme (a folder with given name which should contain colors.conf (and bright colors, I am not sure why at the moment) and maybe a file "wallpaper" which holds the path to the theme wallpaper
    + change wallpaper to the wallpaper with given path. This script also changes env variables (stored in hypr/theme.conf) which hold the current wallpaper path
    + change theme to the theme with a given name. This script either generates new theme based on given wallpaper or changes to the already exisiting one, stored in a hypr/themes/

And that's about it. Took me a week or two to learn btw. Also all the work was done on Arch and scripts are working on bash 5.2.37. Today is 03.07.2025 (dd.mm.yyyy). Idk why I write that tho...
