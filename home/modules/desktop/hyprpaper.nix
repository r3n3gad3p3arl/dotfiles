{ lib, config, ... }: {
  services.hyprpaper.settings =
  let
    wallpapers = ../../wallpapers;
    current = "${wallpapers}/franziska.png";
  in {
    preload = [
      current
    ];

    wallpaper = [
      ",${current}"
    ];
  };

  systemd.user.services.hyprpaper.Service.Slice = lib.mkIf config.services.hyprpaper.enable "background-graphical.slice";
}
