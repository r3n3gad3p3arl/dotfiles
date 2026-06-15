{
  flake.modules.homeManager.dunst =
    { config, ... }:
    {
      services.dunst = {
        enable = true;

        settings = {
          global = {
            enable_posix_regex = true;
            enable_recursive_icon_lookup = true;
            icon_theme = config.gtk.iconTheme.name;
            width = 300;
            notification_limit = 8;
            offset = "(10,10)";
            frame_width = 1;
            gap_size = 8;
            font = "${builtins.elemAt config.fonts.fontconfig.defaultFonts.sansSerif 0} 11";
            markup = "full";
            line_height = 4;
            corner_radius = 0;
            progress_bar_corner_radius = 0;
          };

          urgency_low = {
            background = "#${config.colors.base00}";
            foreground = "#${config.colors.base03}";
            highlight = "#${config.colors.base03}";
            frame_color = "#${config.colors.base02}";
          };

          urgency_normal = {
            background = "#${config.colors.base00}";
            foreground = "#${config.colors.base05}";
            highlight = "#${config.colors.base0D}";
            frame_color = "#${config.colors.base02}";
          };

          urgency_critical = {
            background = "#${config.colors.base00}";
            foreground = "#${config.colors.base08}";
            highlight = "#${config.colors.base08}";
            frame_color = "#${config.colors.base08}";
          };
        };
      };
    };
}
