This is my first rice

I am planning on adding things.

For now my rice has a basic hyprland config and a waybar half of which I stole from someone. Took a big inspiration from [this guy](https://www.reddit.com/r/unixporn/comments/1lr5ri8/hyprland_automatically_switching_themes/#lightbox).

Scripts available:
* **`scripts/chtheme.sh`**: changes themes of waybar and hyprland. Call syntax: `chtheme.sh [options] [theme name] [path/to/wallpaper]`. Option can be **-h/--help** or **-o/--override** for help message and overriding the existing theme based on provided wallpaper respectively. This script uses the following scripts:
    * **`hypr/scripts/chtheme_hypr.sh`**: changes hyprland theme including colors and wallpaper. Call syntax: `chtheme_hypr.sh [theme name] [path/to/wallpaper]`. Changes hyprland theme to a theme with a given name, creates a new one based on provided wallpaper if it doesn't exist yet. If wallpaper is provided and the theme exists - asks the user if he wants to override theme wallpaper. The theme includes **colors.conf**,**colors_bright.conf** and **wallpaper** (stores the path to theme wallpaper). Uses the following scripts:
        * **`hypr/scripts/chwallpaper.sh`**: changes wallpaper using hyprpaper. Call syntax: `chwallpaper.sh [path/to/wallpaper] [theme name]`. Changes wallpaper to provided one and if [theme name] provided adds it to an existing theme.
        * **`hypr/scripts/generate_colors_hypr.sh`**: generates colors based on wallpaper using pywal and adds them to a theme. If the theme already exists asks the user if he wants to override colors.
    * **`waybar/scripts/chtheme_waybar.sh`**: changes waybar theme including only colors. Call syntax: `chtheme_waybar.sh [theme name] [path/to/wallpaper]`. Changes waybar theme by changing an import of colors.css in a style.css. If the theme already exists asks the user if he wants to override it. Uses the following scripts:
        * **`waybar/scripts/generate_colors_waybar.sh`**: generates colors using pywal and adds them to a theme with a given name. Call syntax: `generate_colors_waybar.sh [path/to/wallpaper] [theme name]`.

Also has 2 additional scripts:
* **`toggle_alpha.sh`**: toggles the opacity of hypr windows (changes between 1 and `low_alpha`).
* **`chlowalpha.sh`**: changes the `low_alpha` variable right in the `toggle_alpha.sh` file.
These two are used in `keybinds.conf` connected to `hyprland.conf`.

*Arch, bash 5.2.37, Hyprland 0.49.0, hyprpaper 0.7.5-1, waybar v0.13.0*
