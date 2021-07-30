#!/bin/bash

swaymsg -t get_inputs | jq --raw-output \
     --arg identifier "${1}" \
    '.[] | select(.type=="keyboard" and .identifier==$identifier) | .xkb_active_layout_name'
