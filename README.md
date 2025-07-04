This is my first rice

I am planning on adding things.

For now my rice has a basic hyprland config and a waybar half of which I stole from someone. Took a big inspiration from [this guy](https://www.reddit.com/r/unixporn/comments/1lr5ri8/hyprland_automatically_switching_themes/#lightbox).

There are 3 scripts for changing a theme: 
- generate colors based on an image and create a theme (a folder with given name which should contain colors.conf (and bright colors, I am not sure why at the moment) and maybe a file "wallpaper" which holds the path to the theme wallpaper. It also generates colors.css and a theme for waybar (if the folder **"waybar"** exists in **".config"**
- change wallpaper to the wallpaper with given path. This script also changes env variables (stored in hypr/theme.conf) which hold the current wallpaper path
- change theme to the theme with a given name. This script either generates new theme based on given wallpaper or changes to the already exisiting one, stored in a hypr/themes/. It also changes waybar theme if the **waybar** folder exists and generetes new theme if it doesn't yet exist *(but only if the given theme has wallpaper or other wallpaper provided)*

Also has 2 additional scripts:
- `toggle_alpha.sh`. Toggles the opacity of hypr windows (changes between 1 and `low_alpha`).
- `chlowalpha.sh`. Changes the `low_alpha` variable right in the `toggle_alpha.sh` file.
These two are used in `keybinds.conf` connected to `hyprland.conf`.

*Arch, bash 5.2.37, Hyprland 0.49.0, hyprpaper 0.7.5-1, waybar v0.13.0*
*Man, Im tired...*
