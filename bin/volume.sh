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

  if [[ $NOTIF_BODY = "MUTED" ]]; then
    NOTIF_ICON='audio-volume-muted-symbolic'
  else
    NOTIF_ICON='audio-volume-low-symbolic'
  fi

  notify-send -i $NOTIF_ICON $NOTIF_TITLE $NOTIF_BODY
}

send_volume_notif() {
  VOLUME_LEVEL=$(wpctl get-volume $ASINK | awk '{print $2*100}')

  if [[ $VOLUME_LEVEL -ge 70 ]]; then
    NOTIF_ICON='audio-volume-high-symbolic'
  elif [[ $VOLUME_LEVEL -ge 40 ]]; then
    NOTIF_ICON='audio-volume-medium-symbolic'
  elif [[ $VOLUME_LEVEL -ge 1 ]]; then
    NOTIF_ICON='audio-volume-low-symbolic'
  else
    NOTIF_ICON='audio-volume-muted-symbolic'
  fi
  
  notify-send -i $NOTIF_ICON -h int:value:$VOLUME_LEVEL $NOTIF_TITLE $VOLUME_LEVEL
}

$1
