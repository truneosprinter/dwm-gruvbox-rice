#!/bin/bash

BRIGHTNESS="$(cat /sys/class/backlight/intel_backlight/brightness)"
MAXBRIGHTNESS="$(cat /sys/class/backlight/intel_backlight/max_brightness)"

echo $(echo "scale=2; $BRIGHTNESS/$MAXBRIGHTNESS" | bc -l | tr -d .)%

