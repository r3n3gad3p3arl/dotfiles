{
  services.hyprpaper.settings =
  let
    wallpapers = ../../wallpapers;
  in {
    preload = [
      "${wallpapers}/aceattorney.jpg"
    ];

    wallpaper = [
      ",${wallpapers}/aceattorney.jpg"
    ];
  };
}
