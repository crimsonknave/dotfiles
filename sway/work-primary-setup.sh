#!/usr/bin/bash

# https://devctrl.blog/posts/sway-toolwait-tame-your-autostart-app-layout/
# AT some point might want to do this, but I don't want to deal with adding more files from external sources right now


run_step () {
  echo $1
  swaymsg "$1"
  sleep 0.7
}

run_step "workspace 1:1:Main"
run_step "exec alacritty"
run_step 'exec "firefox --new-window https://github.com/notifications"'
run_step "split toggle"
run_step "layout tabbed"
run_step 'exec "firefox --new-window"'
run_step "focus left"
run_step "focus left"

# Should be focused on alacritty
run_step "split v"
run_step "exec alacritty"
# run_step "exec slack"
run_step "focus up"
run_step "split toggle"
run_step "layout tabbed"
run_step "exec google-chat-linux"
run_step 'exec "/opt/Android Messages/AndroidMessages" --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --no-sandbox'
run_step "exec discord"
# Slack is inconsistent in it's open speed, do it last and then just move it
run_step "exec slack"
sleep 5
run_step "move down"
run_step "focus down"
run_step "kill"
