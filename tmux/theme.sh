#!/usr/bin/bash
window_bg="#b16286"
window_current_bg="#458588"
window_last_bg="#d3869b"
window_text="#282828"
bg_color="#282828"
# bg_color="#665c54"
name_bg_color="#ebdbb2"
name_fg_color="#282828"
name_active_color="#d79921"
right=''
left=''

tmux set-option -g status-bg $bg_color

current_format="#[fg=$bg_color,bg=$window_current_bg]$right"
current_format="$current_format#[bg=$window_current_bg,fg=$window_text] #I - #W  "
current_format="$current_format#[fg=$window_current_bg,bg=$bg_color]$right"

other_format="#[fg=$bg_color]#{?window_last_flag,#[bg=$window_last_bg],#[bg=$window_bg]}$right"
other_format="$other_format#{?window_last_flag,#[bg=$window_last_bg],#[bg=$window_bg]}#[fg=$window_text] #I #W "
other_format="$other_format#{?window_last_flag,#[fg=$window_last_bg],#[fg=$window_bg]},#[bg=$bg_color]$right"

tmux set-option -g window-status-current-format "#[bold]$current_format"
tmux set-option -g window-status-format "#[bold]$other_format"

tmux set-option -g status-left "#{?client_prefix,#[bg=$name_active_color],#[bg=$name_bg_color]}#[fg=$name_fg_color,bold] #S #{?client_prefix,#[fg=$name_active_color],#[fg=$name_bg_color]}#[bg=$bg_color]$right"

tmux set-option -g status-right ""
