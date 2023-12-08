#!/usr/bin/env bash

# Spawn terminal with two columns of installed fonts families
alacritty --hold -e \
    bash -c "fc-list -b | grep family | cut -d: -f2 | \
    grep -v en | cut -d' ' -f1-4 | sed 's/(s)//g;s/\"//g;' \
    | sort | uniq | pr -2 -t | less"
