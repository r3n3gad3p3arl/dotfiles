send_current_battery_notif() {
   BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
   notify-send -h int:value:$BATTERY_LEVEL 'Battery'
}

$1
