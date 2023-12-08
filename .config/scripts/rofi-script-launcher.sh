#!/usr/bin/env bash

bash ~/.config/scripts/$(find ~/.config/scripts/* -printf "%f\n" | rofi -dmenu)
