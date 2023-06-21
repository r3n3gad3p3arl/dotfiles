{ pkgs, config, lib, ... }: {
   home.packages = lib.mkIf config.services.dunst.enable [ pkgs.libnotify ];

   services.dunst.settings =
   let colors = config.colorScheme.colors;
   in {
      global = {
         enable_posix_regex = true;
         width = 300;
         notification_limit = 8;
         offset = "8x8";
         frame_width = 1;
         gap_size = 8;
         font = "Dina 11";
         background = "#${colors.base00}";
         foreground = "#${colors.base05}";
         highlight = "#${colors.base0D}";
         frame_color = "#${colors.base03}";
         markup = "full";
      };
   };
}
