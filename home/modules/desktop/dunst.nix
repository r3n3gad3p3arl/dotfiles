{ config, colors, ... }: {
  services.dunst.settings = {
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
      background = "#${colors.base00}";
      foreground = "#${colors.base03}";
      highlight = "#${colors.base03}";
      frame_color = "#${colors.base02}";
    };

    urgency_normal = {
      background = "#${colors.base00}";
      foreground = "#${colors.base05}";
      highlight = "#${colors.base0D}";
      frame_color = "#${colors.base02}";
    };

    urgency_critical = {
      background = "#${colors.base00}";
      foreground = "#${colors.base08}";
      highlight = "#${colors.base08}";
      frame_color = "#${colors.base08}";
    };
  };
}
