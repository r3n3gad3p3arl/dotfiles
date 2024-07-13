{
  services.hyprpaper.settings =
  let
    wallpapers = ../../wallpapers;
  in {
    preload = [
      "${wallpapers}/aapicnic.jpg"
    ];

    wallpaper = [
      ",${wallpapers}/aapicnic.jpg"
    ];
  };
}
