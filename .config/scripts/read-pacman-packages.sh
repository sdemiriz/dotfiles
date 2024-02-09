#!/bin/bash

sudo pacman -Qqem >| /home/sdemiriz/.config/pacman/aur-pkglist.txt
sudo pacman -Qqe >| /home/sdemiriz/.config/pacman/pacman-pkglist.txt
