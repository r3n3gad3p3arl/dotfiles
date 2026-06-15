{
  flake.modules.homeManager.hyprpaper = {
    services.hyprpaper = {
      enable = true;

      settings.wallpaper = [
        {
          monitor = "";
          path = "${../../wallpapers}/phoenixmaya.png";
        }
      ];
    };

    systemd.user.services.hyprpaper.Service.Slice = "background-graphical.slice";
  };
}
