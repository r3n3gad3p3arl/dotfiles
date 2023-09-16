ASINK='@DEFAULT_AUDIO_SINK@'
PERCENT=4
NOTIF_TITLE='Volume'

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

   NOTIF_BODY=$(wpctl get-volume $ASINK | grep -o 'MUTED')
   NOTIF_BODY="${NOTIF_BODY:-UNMUTED}"
   notify-send $NOTIF_TITLE $NOTIF_BODY
}

send_volume_notif() {
   VOLUME_LEVEL=$(wpctl get-volume $ASINK | awk '{print $2*100}')
   notify-send -h int:value:$VOLUME_LEVEL $NOTIF_TITLE
}

$1
