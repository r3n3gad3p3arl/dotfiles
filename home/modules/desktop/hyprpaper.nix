{
  services.hyprpaper.settings =
  let
    wallpapers = ../../wallpapers;
    current = "${wallpapers}/xmen97.jpeg";
  in {
    preload = [
      current
    ];

    wallpaper = [
      ",${current}"
    ];
  };
}
