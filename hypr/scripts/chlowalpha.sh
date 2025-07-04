#!/bin/bash

[[ ! "$1" =~ ^[+-][0-9]+\.[0-9]*$ ]] && { echo "wrong float format";exit 0; }

low_op=$(cat "$HOME/.config/hypr/scripts/toggle_alpha.sh" | grep low_opacity= | awk -F'=' '{print $2}')
low_op=$(echo "$low_op $1" | bc | awk '{printf "%.2f", $0}')

[[ $(echo "$low_op < 0.2" | bc) == 1 ]] && low_op=0.2
[[ $(echo "$low_op > 1.0" | bc) == 1 ]] && low_op=1.0

sed -i -e "s|low_opacity=.*|low_opacity=$low_op|" "$HOME/.config/hypr/scripts/toggle_alpha.sh"

hyprctl keyword decoration:active_opacity "$low_op"
hyprctl keyword decoration:inactive_opacity "$low_op"

