{
  flake.modules.nixos.hyprlock = {
    security.pam.services.hyprlock = { };
  };

  flake.modules.homeManager.hyprlock =
    { config, ... }:
    {
      programs.hyprlock = {
        enable = true;

        settings = {
          background = [
            {
              monitor = "";
              path = "${../../wallpapers}/aagirls.png";
            }
          ];

          input-field = [
            {
              monitor = "";
              size = "140, 35";
              outline_thickness = 1;
              outer_color = "rgb(${config.colors.base03})";
              inner_color = "rgb(${config.colors.base00})";
              font_color = "rgb(${config.colors.base05})";
              check_color = "rgb(${config.colors.base0D})";
              fail_color = "rgb(${config.colors.base08})";
              position = "0, 50";
              valign = "bottom";
            }
          ];
        };
      };
    };
}
