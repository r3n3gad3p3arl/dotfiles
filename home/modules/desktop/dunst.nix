{ config, ... }: {
  services.dunst.settings =
  let colors = config.colorScheme.palette;
  in {
    global = {
      enable_posix_regex = true;
      width = 300;
      notification_limit = 8;
      offset = "11x11";
      frame_width = 0;
      gap_size = 8;
      font = "Rubik 11";
      markup = "full";
      line_height = 4;
      corner_radius = 0;
      progress_bar_corner_radius = 0;
    };

    urgency_low = {
      background = "#${colors.base01}";
      foreground = "#${colors.base03}";
      highlight = "#${colors.base0D}";
      frame_color = "#${colors.base03}";
    };

    urgency_normal = {
      background = "#${colors.base01}";
      foreground = "#${colors.base05}";
      highlight = "#${colors.base0D}";
      frame_color = "#${colors.base05}";
    };

    urgency_critical = {
      background = "#${colors.base01}";
      foreground = "#${colors.base08}";
      highlight = "#${colors.base08}";
      frame_color = "#${colors.base08}";
    };
  };
}
