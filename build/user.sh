#!/bin/bash
export XDG_RUNTIME_DIR=/run/user/1000
export WLR_NO_HARDWARE_CURSORS=1
#env
pipewire &
pipewire-pulse &
wireplumber &
#gamescope -eb --expose-wayland -- steam > gamescope.log 2>&1 &
Hyprland > hyprland.log 2>&1 &
#export WAYLAND_DISPLAY=gamescope-0
export WAYLAND_DISPLAY=wayland-1
export DISPLAY=:0
sleep 1
sunshine > sunshine.log 2>&1 &
#wait
tail -f /dev/null
