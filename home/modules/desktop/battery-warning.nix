{
   systemd.user.timers."battery-warning" = {
      Unit.Description = "Check battery level every 5 minutes and send a notification if low.";
      Install.WantedBy = [ "timers.target" ];

      Timer = {
         OnUnitActiveSec = 300;
         Unit = "battery-warning.service";
      };
   };

   systemd.user.services."battery-warning" = {
      Unit.Description = "Check battery level every 5 minutes and send a notification if low.";
      Install.WantedBy = [ "graphical-session.target" ];

      Service = {
         Type = "simple";
         ExecStart = "${../../bin/battery.sh} send_battery_warning_notif";
      };
   };
}
