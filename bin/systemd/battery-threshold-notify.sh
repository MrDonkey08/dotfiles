#!/usr/bin/env bash
# Description:
#
# Script created to make the system notify the user when the battery reach the
# desired `charge_start_threshold`, or `charge_stop_threshold`
#
# This script is useful when the laptop doesn't have hardware/driver support for
# _battery charge threshold_

# Get
#!/bin/bash

# Get battery status and capacity
bat_capacity=$(cat /sys/class/power_supply/BAT*/capacity)
bat_status=$(cat /sys/class/power_supply/BAT*/status)

# Charging threshold alert
if [[ "$bat_capacity" -ge 80 ]]; then
	if [[ "$bat_status" == "Charging" || "$bat_status" == "Full" ]]; then
		notify-send \
			"⚡ Battery Alert" \
			"Battery is at $bat_capacity% ($bat_status) — Consider unplugging."
	fi

# Discharging threshold alert
elif [[ "$bat_capacity" -le 40 && "$bat_status" == "Discharging" ]]; then
	notify-send \
		"🔋 Battery Alert" \
		"Battery is at $bat_capacity% (discharging) — Consider plugging in."
fi
