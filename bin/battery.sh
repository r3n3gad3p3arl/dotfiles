BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

send_current_battery_notif() {
   notify-send -h int:value:$BATTERY_LEVEL "$BATTERY_STATUS - $BATTERY_LEVEL%"
}

$1
