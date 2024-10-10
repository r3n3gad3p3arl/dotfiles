PERCENT=4

raise_brightness() {
  brightnessctl set $PERCENT%+
  send_brightness_notif
}

lower_brightness() {
  brightnessctl set $PERCENT%-
  send_brightness_notif
}

send_brightness_notif() {
  MAX=$(brightnessctl max)
  CURRENT=$(brightnessctl get)
  BRIGHT_LEVEL=$((100 * $CURRENT / $MAX))

  if [[ $BRIGHT_LEVEL -ge 70 ]]; then
    NOTIF_ICON='display-brightness-high-symbolic'
  elif [[ $BRIGHT_LEVEL -ge 40 ]]; then
    NOTIF_ICON='display-brightness-medium-symbolic'
  elif [[ $BRIGHT_LEVEL -ge 1 ]]; then
    NOTIF_ICON='display-brightness-low-symbolic'
  else
    NOTIF_ICON='display-brightness-off-symbolic'
  fi

  notify-send -i $NOTIF_ICON -h int:value:$BRIGHT_LEVEL 'Brightness' $BRIGHT_LEVEL
}

$1
