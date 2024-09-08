{
  services.hyprpaper.settings =
  let
    wallpapers = ../../wallpapers;
    current = "${wallpapers}/phoenixmaya.png";
  in {
    preload = [
      current
    ];

    wallpaper = [
      ",${current}"
    ];
  };
}
