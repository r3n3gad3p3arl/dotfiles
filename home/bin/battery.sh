send_current_battery_notif() {
   notify-send -h int:value:$(get_battery_percent) 'Battery'
}

get_battery_percent() {
   cat /sys/class/power_supply/BAT0/capacity
}

$1
