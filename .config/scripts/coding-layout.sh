#!/usr/bin/env bash

i3-msg "workspace 1; append_layout ~/.i3/layouts/monitor1.json; exec alacritty; exec alacritty"
i3-msg "workspace 2; append_layout ~/.i3/layouts/monitor2.json; exec firefox"
