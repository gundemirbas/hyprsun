#!/bin/bash
unset XDG_RUNTIME_DIR
pkill steam
pkill gamescope
pkill sunshine
pkill dbus
pkill pipewire
pkill seatd
pkill NetworkManager
rm /run/dbus /run/user/1000 /run/user/0 /run/NetworkManager -rf
rm /usr/share/wireplumber/bluetooth.lua.d/50-bluez-config.lua -rf
install -d -o root -g root /run/dbus
install -d -o root -g root /run/user/0
install -d -o user -g user /run/NetworkManager
install -d -o user -g user /run/user/1000
groupadd -g 026 -o gdevice
groupadd -g 303 -o grender
groupadd -g 174 -o ginput
groupadd -g 003 -o gtty
usermod -aG gdevice,grender,ginput,gtty user
export XDG_RUNTIME_DIR=/run/user/0
dbus-daemon --system
NetworkManager
seatd -u user -g user &
su - user -c "
dbus-run-session -- /home/user/user.sh &
"
#wait
tail -f /dev/null
