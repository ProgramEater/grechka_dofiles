#!/bin/bash

cur_alpha=$(hyprctl getoption decoration:active_opacity | grep "float:" | awk '{print $2}' )
low_opacity=0.88

if [[ $cur_alpha =~ 1\.[0-9]* ]]; then
	hyprctl keyword decoration:active_opacity "$low_opacity"
	hyprctl keyword decoration:inactive_opacity "$low_opacity"
else
	hyprctl keyword decoration:active_opacity "1.0"
	hyprctl keyword decoration:inactive_opacity "1.0"
fi
