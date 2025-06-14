#!/bin/bash

# Get volume level
VOLUME=$(amixer -M get Master | grep -o '[0-9]*%' | head -1 | tr -d '%')

# Define volume icons
MUTE_ICON="x"      # Muted
LOW_VOLUME=""     # Low volume
MEDIUM_VOLUME=""  # Medium volume
HIGH_VOLUME=""    # High volume

# Determine volume state
if amixer -M get Master | grep -q '\[off\]'; then
    ICON=$MUTE_ICON
elif [[ $VOLUME -eq 0 ]]; then
    ICON=$MUTE_ICON
elif [[ $VOLUME -le 30 ]]; then
    ICON=$LOW_VOLUME
elif [[ $VOLUME -le 70 ]]; then
    ICON=$MEDIUM_VOLUME
else
    ICON=$HIGH_VOLUME
fi

# Display volume status
echo "$ICON  $VOLUME%"

