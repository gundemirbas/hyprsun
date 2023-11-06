FROM archlinux:latest

RUN echo "[multilib]" >> /etc/pacman.conf && \
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
pacman -Syu --noconfirm --needed git base-devel && \
useradd -m user && \
  echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
  dbus-uuidgen > /etc/machine-id

USER user
WORKDIR /home/user

RUN git clone https://aur.archlinux.org/yay-bin.git && \
cd yay-bin && makepkg --noconfirm -si && \
yay --noconfirm -S nano gamemode mangohud kitty seatd \
  libayatana-appindicator libnotify steam \
  pipewire pipewire-pulse wireplumber networkmanager \
  gamescope-git hyprland-git sunshine-git && \
yay --noconfirm -Rdd mesa lib32-mesa amdvlk lib32-amdvlk && \
yay --noconfirm -S mesa-git lib32-mesa-git && \
yay --noconfirm -Rdd base-devel make gcc guile clang && \
yay --noconfirm -Yc && \
sudo rm /home/user/* /home/user/.* /var/cache/* /var/cache/.* -rf

EXPOSE 47984-47990/tcp
EXPOSE 48010
EXPOSE 47998-48000/udp

ENTRYPOINT ["tail", "-f", "/dev/null"]
