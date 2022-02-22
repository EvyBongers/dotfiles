#!/usr/bin/env zsh

IDENTIFIER="${1:-}"

swaymsg -t get_inputs | jq --raw-output \
     --arg type "keyboard" \
     --arg identifier "${IDENTIFIER}" \
    'map(select(contains($ARGS.named)) | .xkb_active_layout_name) | unique[]'
