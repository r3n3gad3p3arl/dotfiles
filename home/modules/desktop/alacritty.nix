{
   programs.alacritty = {
      enable = true;

      settings = {
         window = {
            padding = {
               x = 10;
               y = 10;
            };
         };

         font = let font = "FantasqueSansM Nerd Font";
         in {
            normal = {
               family = font;
               style = "Regular";
            };

            bold = {
               family = font;
               style = "Bold";
            };

            italic = {
               family = font;
               style = "Italic";
            };

            bold_italic = {
               family = font;
               style = "Bold Italic";
            };

            size = 11;
         };
      };
   };
}
