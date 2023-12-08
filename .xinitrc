#!/bin/bassh

[ -f /etc/xprofile] && . /etc/xprofile
[ -f ~/.xprofile] && . ~/.xprofile

# Configure mouse sensitivity
xinput --set-prop 8 152 0.5 0 0 0 0.5 0 0 0 1

# Configure monitor layout
xrandr --output DP-2 --primary --mode 2560x1440 --pos 0x0 --output DVI-D-1 --mode 1920x1080 --pos 2560x360

# Starup window manager
exec i3
