#!/bin/bash

i3-msg "workspace 1; append_layout ~/.config/i3/layouts/coding-monitor1.json; exec alacritty; exec alacritty"
i3-msg "workspace 2; append_layout ~/.config/i3/layouts/coding-monitor2.json; exec firefox"
