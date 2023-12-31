PERCENT=4

raise_brightness() {
  brightnessctl set $PERCENT%+
  send_brightness_notif
}

lower_brightness() {
  brightnessctl set $PERCENT%-
  send_brightness_notif
}

get_brightness_percent() {
  MAX=$(brightnessctl max)
  CURRENT=$(brightnessctl get)

  # slightly inaccurate but good enough for this purpose
  echo $((100 * $CURRENT / $MAX))
 }

 send_brightness_notif() {
   notify-send -h int:value:$(get_brightness_percent) 'Brightness'
 }

 $1
