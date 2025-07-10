#!/usr/bin/env bash

IMG_DIR=$2
IMG_PATH=$IMG_DIR/$(date +'%F_%Hh%Mm%Ss_grim.png')
SCREEN=$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name')

print_current_screen() {
  grim -o $SCREEN $IMG_PATH
  send_print_notif
}

print_selection() {
  grim -g "$(slurp)" $IMG_PATH
  send_print_notif
}

send_print_notif() {
  notify-send -i $IMG_PATH 'Screenshot Taken' $IMG_PATH
}

$1 $2
