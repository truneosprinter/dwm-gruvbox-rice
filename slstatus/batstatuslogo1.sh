#!/bin/bash

# Get battery percentage and charging status
BAT_PATH="/sys/class/power_supply/BAT1"
BAT_CAPACITY=$(cat "$BAT_PATH/capacity")
BAT_STATUS=$(cat "$BAT_PATH/status")

# Define battery icons
FULL_BATTERY=""        #  
HIGH_BATTERY=""        #  
LOW_BATTERY=""         #  
CRITICAL_BATTERY=""     #  
CHARGING_ICONS=("" "" "" "" "") # Cycle through icons
BATTERY_NOT_PRESENT = "n/a :("

# Determine battery state
if [ -d "$BAT_PATH" ]; then
	if [[ "$BAT_STATUS" == "Charging" ]]; then
	    ICON_INDEX=$(( ($(date +%s) % 5) + 1 ))  # Adjust index to match Zsh array (1-based)
	    ICON=${CHARGING_ICONS[$ICON_INDEX]}
	    if [[ $BAT_CAPACITY -ge 95 ]]; then  # Ensure full battery icon shows when nearly full
	        ICON=$FULL_BATTERY
	    fi
	elif [[ $BAT_CAPACITY -ge 80 ]]; then
	    ICON=$FULL_BATTERY
	elif [[ $BAT_CAPACITY -ge 40 ]]; then
	    ICON=$HIGH_BATTERY
	elif [[ $BAT_CAPACITY -ge 20 ]]; then
	    ICON=$LOW_BATTERY
	else
	    ICON=$CRITICAL_BATTERY
	fi

	echo "bat1: $ICON  $BAT_CAPACITY%"
else
	echo "bat1: dcd"
fi


