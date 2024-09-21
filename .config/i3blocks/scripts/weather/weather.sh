#!/bin/bash

# Fetch weather data using curl and parse it for Sonbhadra, Uttar Pradesh
location="Sonbhadra, Uttar Pradesh"
weather_data=$(curl -s "https://wttr.in/Sonbhadra?format=1")

# Check if data was fetched successfully
if [ -z "$weather_data" ]; then
  echo "Weather: N/A"
else
  echo "$weather_data"
fi
