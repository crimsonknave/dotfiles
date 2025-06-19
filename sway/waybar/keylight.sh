#!/usr/bin/bash
echo "run" >> /tmp/keylight.log

if [[ `whoami` == "crimsonknave" ]]; then
  name="work"
else
  name="personal"
fi

PATH="/home/crimsonknave/.dotfiles/bin:$PATH"

if [[ $1 == "status" ]]; then
  status=$(elgato $name "status")
  if [[ $status == "1" ]]; then
    echo '{"class": "on", "tooltip": "Turn Keylight Off"}'
		
  else
    echo '{"class": "off", "tooltip": "Turn Keylight On"}'
  fi
else
  elgato $name
fi
