{ colors, ... }: {
  programs.hyprlock.settings =
  let
    wallpapers = ../../wallpapers;
  in {
    background = [
      {
        monitor = "";
        path = "${wallpapers}/aagirls.png";
      }
    ];

    input-field = [
      {
        monitor = "";
        size = "140, 35";
        outline_thickness = 1;
        outer_color = "rgb(${colors.base03})";
        inner_color = "rgb(${colors.base00})";
        font_color = "rgb(${colors.base05})";
        check_color = "rgb(${colors.base0D})";
        fail_color = "rgb(${colors.base08})";
        position = "0, 50";
        valign = "bottom";
      }
    ];
  };
}
