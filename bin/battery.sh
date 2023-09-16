BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

send_current_battery_notif() {
   notify-send -h int:value:$BATTERY_LEVEL "$BATTERY_STATUS - $BATTERY_LEVEL%"
}

check_low_battery() {
   if [ $BATTERY_STATUS = 'Discharging' ]; then
      if [ $BATTERY_LEVEL -lt 5 ]; then
         systemctl hibernate
      elif [ $BATTERY_LEVEL -lt 15 ]; then
         notify-send -u 'critical' 'Low Battery' 'Charge now!'
      fi
   fi
}

$1
