#!/usr/bin/bash
# SDL_VIDEODRIVER=wayland /home/elim/.dotfiles/hyperfocus/game-chunk.sh %command%
# SDL_VIDEODRIVER="wayland,x11" %command%
# env __GLX_VENDOR_LIBRARY_NAME=mesa __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink /home/elim/.dotfiles/hyperfocus/game-chunk.sh %command%

game=$@
unit="m"
kill_time=30
save_message="                                                    $sleep_time$unit have passed. You have $save_time$unit  to save"
launch_message="                                                                              Playing for $kill_time$unit."
swaynag_settings='-o DP-1 -y overlay --message-padding 24 --button-padding 19 -f "Monospace 24"'

duration_message () {
  echo "--button-dismiss $1m" "echo '$1' > /tmp/game-chunk-time"
}

echo $(duration_message 6)

day=$(date +%a)
hour=$(date +%H)
hour=19
rm -rf /tmp/vacation-true
echo $kill_time > /tmp/game-chunk-time
case "$day-$hour" in
    (*-1[89])        ;&
    (*-2[01]) ;&
    (Sat-1[1234567]) ;&
    (Sun-1[1234567]) 
      echo swaynag -m "$launch_message" --button-dismiss "5m" 'echo "5" > /tmp/game-chunk-time' -s Start! $swaynag_settings
      echo swaynag -m "$launch_message" $(duration_message 5) -s Start! $swaynag_settings
      swaynag -m "$launch_message" $(duration_message 5) -s Start! $swaynag_settings;;
    (*-1[1234567]) 
        swaynag -m "Are you on vacation?" -s No --button-dismiss Yes 'touch /tmp/vacation-true' --background F0B27A --button-background F0B27A --text 1C2833 --button-text 1C2833 $swaynag_settings -d
        sleep 1
        if [ -f /tmp/vacation-true ]; then
          echo "On vacation, playing during the day on a weekday is allowed."
          swaynag -m "$launch_message" -s Start! $swaynag_settings
        else
          echo "Not on vacation, no playing."
          exit 1
        fi;;
    (*)
        swaynag -m "Not an allowed time" -s Fine $swaynag_settings
        exit 1;
esac

cat /tmp/game-chunk-time
kill_time=$(cat /tmp/game-chunk-time)
save_time=1
sleep_time=$(($kill_time-$save_time))
echo "Killing game after $kill_time$unit"
echo "Warning to save after $sleep_time$unit"
(sleep $sleep_time$unit && swaynag -m "$save_message" -s Saved! $swaynag_settings; echo "Save message removed") &
# This appears to end up being the scripts pid at the end, but that's fine
# we can kill the script too as long as it cleans up it's swaynag
pid=$!

timeout $kill_time$unit $game

echo "Killing sleep/save $pid and children"
pkill -P $pid
