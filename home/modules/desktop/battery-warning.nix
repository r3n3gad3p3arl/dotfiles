{ pkgs, ... }: {
   systemd.user = {
      timers.battery-warning = {
         Unit.Description = "Check for low battery every minute";

         Timer = {
            OnBootSec = "30sec";
            OnUnitActiveSec = "1min";
         };

         Install.WantedBy = [ "timers.target" ];
      };

      services.battery-warning = {
         Unit.Description = "Check for low battery";

         Service = {
            ExecStart = "${pkgs.meowPkgs.bin.battery} check_low_battery";
         };
      };
   };
}
