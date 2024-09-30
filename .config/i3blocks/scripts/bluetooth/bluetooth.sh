#!/bin/bash

# Get the MAC address of the connected Bluetooth device
DEVICE_MAC=$(bluetoothctl devices Connected | awk '{print $2}')

if [ -z "$DEVICE_MAC" ]; then
  echo "Bluetooth: Disconnected"
  exit 0
fi

# Get the name of the connected device
DEVICE_NAME=$(bluetoothctl info "$DEVICE_MAC" | grep "Name" | awk -F 'Name: ' '{print $2}')

# Try to fetch the battery level using bluetoothctl
BATTERY_HEX=$(bluetoothctl info "$DEVICE_MAC" | grep "Battery Percentage" | awk '{print $3}')

# Fallback if battery percentage is not available
if [ -z "$BATTERY_HEX" ]; then
  BATTERY="N/A"
else
  # Convert hex battery value to decimal (remove 0x if present)
  BATTERY=$(echo $((BATTERY_HEX)))
fi

# Output the name and battery level for i3blocks
echo "$DEVICE_NAME: 🔋 $BATTERY%"

# Optional: exit code for color customization in i3blocks
#if [ "$BATTERY" != "N/A" ] && [ "$BATTERY" -le 20 ]; then
#  exit 33 # Example: change color to red for low battery
#else
#  exit 0 # Normal color
#fi
