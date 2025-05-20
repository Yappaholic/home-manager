#!/bin/bash

swww-daemon &
swww img ~/Pictures/wallpaper.png
wlsunset -t 2500 -T 6500 -S 06:30 -s 21:30 &
waybar &
