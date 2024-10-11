#!/usr/bin/bash

game=$@
kill_time=30
save_time=1
sleep_time=$(($kill_time-$save_time))
unit="m"
save_message="                                                    $sleep_time$unit have passed. You have $save_time$unit  to save"
launch_message="                                                                              Playing for $kill_time$unit."
swaynag_settings='-o DP-1 -y overlay --message-padding 24 --button-padding 19 -f "Monospace 24"'

day=$(date +%a)
hour=$(date +%H)
rm -rf /tmp/vacation-true
case "$day-$hour" in
    (*-1[89])        ;&
    (*-2[01]) ;&
    (Sat-1[1234567]) ;&
    (Sun-1[1234567]) 
        swaynag -m "$launch_message" -s Start! $swaynag_settings;;
    (*-1[1234567]) 
        swaynag -m "Are you on vacation?" -s No --button-dismiss Yes 'touch /tmp/vacation-true' --background F0B27A --button-background F0B27A --text 1C2833 --button-text 1C2833 $swaynag_settings -d
        sleep 1
        if [ -f /tmp/vacation-true ]; then
          echo "On vacation, playing during the day on a weekday is allowed."
        else
          echo "Not on vacation, no playing."
          exit 1
        fi;;
    (*)
        swaynag -m "Not an allowed time" -s Fine $swaynag_settings
        exit 1;
esac

echo "Killing game after $kill_time$unit"
echo "Warning to save after $sleep_time$unit"
(sleep $sleep_time$unit && swaynag -m "$save_message" -s Saved! $swaynag_settings; echo "Save message removed") &
# This appears to end up being the scripts pid at the end, but that's fine
# we can kill the script too as long as it cleans up it's swaynag
pid=$!

timeout $kill_time$unit $game

echo "Killing sleep/save $pid and children"
pkill -P $pid
