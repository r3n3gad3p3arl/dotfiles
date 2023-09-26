IMG_PATH=$XDG_PICTURES_DIR/$(date +'%F_%T_grim.png')
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

$1
