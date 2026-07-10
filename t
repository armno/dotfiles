#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/code -maxdepth 2 -mindepth 1 -type d | fzf --reverse)
fi

[[ -z $selected ]] && exit

dirname=$(basename "$selected" | sed 's/\./_/g')

tmux switch-client -t "=$dirname" 2>/dev/null && exit 0

tmux new-session -c "$selected" -d -s "$dirname" && tmux switch-client -t "$dirname"
