{ pkgs, ... }: {
   services.swayidle = {
      systemdTarget = "graphical-session.target";

      timeouts = [
         {
            timeout = 90;
            command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 20%-";
            resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
         }

         {
            timeout = 120;
            command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
            resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
         }

         { timeout = 150; command = "${pkgs.swaylock}/bin/swaylock -f"; }
         { timeout = 270; command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on & ${pkgs.systemd}/bin/systemctl suspend"; }
      ];
   };
}
