#!/bin/bash

export EDITOR=nvim
export TERMINAL=alacritty
export BROWSER=firefox

export HISTFILESIZE=20000
export HISTSIZE=10000
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# Ignore duplicates in history
shopt -s histappend
shopt -s cmdhist

# Remove the need to type cd to change directories
shopt -s autocd

# Handle misspellings
shopt -s cdspell

# Prevent overwrites to existing files (use >| to force instead of just >)
set -C

# Aliases
alias ll='ls -lAh --color=auto'
alias e='nvim'
alias sudo='sudo '
alias ..='cd ..'
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'

# NixOS aliases
alias nswitch='sudo nixos-rebuild switch'
alias nclean='sudo nix-collect-garbage -d'

# Git shorthand aliases
alias gst='git status'
alias gad='git add'
alias gcm='git commit -m '
alias gps='git push'
alias gbr='git branch'
alias gch='git checkout'
alias gpl='git pull'
alias gdf='git diff'

# Dotfile management shorthand aliases
alias dots='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dst='dots status'
alias dad='dots add'
alias dcm='dots commit -m '
alias dps='dots push'
alias dbr='dots branch'
alias dch='dots checkout'
alias dpl='dots pull'
alias ddf='dots diff'

# Micromamba
alias conda='micromamba'

# Define prompt colors
nord1="2E3440"
nord2="3B4252"
nord3="434C5E"
nord4="4C566A"
nord5="D9DEE9"
nord6="E5E9F0"
nord7="ECEFF4"
nord8="8FBCBB"
nord9="88C0D0"
nord10="81A1C1"
nord11="5E81AC"
nord12="BF616A"
nord13="D08770"
nord14="EBCB8B"
nord15="A3BE8C"
nord16="B48EAD"

# Set up PS1
sty() {
    case $1 in
        bo) echo "01;" ;; # [bo]ld
        d) echo "02;" ;; # [d]im
        i) echo "03;" ;; # [i]talic
        u) echo "04;" ;; # [u]nderline
        bl) echo "05;" ;; # [bl]ink
        r) echo "06;" ;; # [r]everse
        o) echo "07;" ;; # [o]verline
        *) echo "" ;; # anything else
    esac
}

# Specify whether [f]oreground or [b]ackground is to be colored
grd() {
    case $1 in
        f) echo "38;2;" ;;
        b) echo "48;2;" ;;
        *) echo "" ;;
    esac
}

# Specify [R]ed, [G]reen, [B]lue colors for the chunk
rgb() {
    echo "$1;$2;$3"
}

# Convert [RRGGBB] hex to three decimal form [rrr ggg bbb]
h2d() {
    r=$(echo $1 | cut -c 1-2)
    g=$(echo $1 | cut -c 3-4)
    b=$(echo $1 | cut -c 5-6)

    echo "obase=10; ibase=16; ${r}; ${g}; ${b}" | bc
}

# Start chunk and apply configuration
vis() {
    # If style, [fore/back]ground and [RRGGBB] are all provided
    if [ $# -eq 3 ]; then
        echo "\[\e[$(sty $1)$(grd $2)$(rgb $(h2d $3))m\]" 
    fi
    
    # If only style and [RRGGBB] is provided
    if [ $# -eq 2 ]; then
        echo "\[\e[$(grd $2)$(rgb $(h2d $3))m\]" 
    fi

    # If only style is provided
    if [ $# -eq 1 ]; then
        echo "\[\e[$(sty $1)m\]" 
    fi
}

# End chunk
siv() {
    echo "\[\e[0m\]"
}

# Combine all parts of a chunk into a single unit
chunk() {
    pre=$(vis $1 $2 $3)
    main=$4 
    post=$(siv)

    echo "$pre$main$post "
}

# Extract the current Conda environment
cnd() {
    if [ ! -z "$CONDA_PROMPT_MODIFIER" ]; then
        echo $CONDA_PROMPT_MODIFIER
    fi
}

prompt_cmd() {
    unset PS1
    PS1="\n"
    PS1+=$(chunk bo f ${nord15} "$(cnd)")
    PS1+=$(chunk bo f ${nord12} "[$(git branch --show-current 2>/dev/null)]")
    PS1+=$(chunk bo f ${nord11} "\u")
    PS1+=$(chunk bo f ${nord11} "\w")
    PS1+="\n"
    PS1+=$(chunk bo f ${nord5} "\$")
}

export PROMPT_COMMAND=prompt_cmd
