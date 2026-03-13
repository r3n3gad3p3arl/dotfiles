{ lib, config, ... }:
{
  services.hyprpaper.settings =
    let
      wallpapers = ../../wallpapers;
      current = "${wallpapers}/phoenixmaya.png";
    in
    {
      wallpaper = [
        {
          monitor = "";
          path = current;
        }
      ];
    };

  systemd.user.services.hyprpaper.Service.Slice =
    lib.mkIf config.services.hyprpaper.enable "background-graphical.slice";
}
