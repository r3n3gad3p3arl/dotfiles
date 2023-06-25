BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
NOTIF_TITLE='Battery'

send_current_battery_notif() {
   notify-send -h int:value:$BATTERY_LEVEL $NOTIF_TITLE
}

send_battery_warning_notif() {
   if [ $BATTERY_LEVEL -lt 15 ]; then
      notify-send $NOTIF_TITLE 'Low battery'
   fi
}

$1
