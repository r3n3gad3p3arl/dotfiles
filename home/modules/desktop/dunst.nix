{ pkgs, ... }: {
   home.packages = with pkgs; [ libnotify ];

   services.dunst = {
      enable = true;

      settings = {
         global = {
            enable_posix_regex = true;
            width = 300;
            notification_limit = 8;
            offset = "10x10";
            frame_width = 1;
            gap_size = 8;
            font = "Dina 11";
            background = "#1d1f21";
            foreground = "#c5c8c6";
            highlight = "#81a2be";
            frame_color = "#969896";
            markup = "full";
         };
      };
   };
}
