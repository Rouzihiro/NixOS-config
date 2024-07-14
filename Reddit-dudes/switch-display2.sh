#!/bin/mksh

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

if xrandr | grep "$EXTERNAL connected" > /dev/null; then
    xrandr --output $INTERNAL --off --output $EXTERNAL --auto
else
    xrandr --output $EXTERNAL --off --output $INTERNAL --auto
fi