{ pkgs, ... }: {
  services.swayidle = {
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

      { timeout = 150; command = "${pkgs.swaylock}/bin/swaylock -fi $(${pkgs.meowPkgs.bin.wallpaper} get_random_wallpaper ${../../wallpapers})"; }
      { timeout = 270; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
