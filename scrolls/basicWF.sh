#!/bin/bash

packages=(
openssh
htop
curl
wget
xclip
tree
zathura
alsa-utils
bc
compton
dmenu
dunst
entr
feh
firefox
gdb
gimp
imagemagick
jq
mpv
neofetch
nitrogem
pulseaudio
pulseaudio-alsa
pulseaudio-bluetooth
pygmentize
python-pip
python-pygments
rsync
rtv
scrot
shellcheck
socat
surf
sxiv
tmux
zip
zsh
)

sudo pacman -S --noconfirm "${packages[@]}"
