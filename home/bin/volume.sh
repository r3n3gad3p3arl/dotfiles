ASINK='@DEFAULT_AUDIO_SINK@'
PERCENT=4

raise_volume() {
   wpctl set-volume -l 1.0 $ASINK $PERCENT%+
   send_volume_notif
}

lower_volume() {
   wpctl set-volume $ASINK $PERCENT%-
   send_volume_notif
}

toggle_volume_mute() {
   wpctl set-mute $ASINK toggle
}

get_volume_percent() {
   wpctl get-volume $ASINK | awk '{print $2*100}'
}

send_volume_notif() {
   notify-send -h int:value:$(get_volume_percent) 'Volume'
}

$1
