{ pkgs, config, ... }: {
   home.packages = with pkgs; [ libsixel ];

   programs.foot = {
      enable = true;

      settings = {
         main = {
            font = "Dina,Cozette,Unifont";
            pad = "8x8";
         };

         colors =
         let colors = config.colorScheme.colors;
         in {
            background = colors.base00;
            foreground = colors.base05;

            regular0 = colors.base00;
            regular1 = colors.base08;
            regular2 = colors.base0B;
            regular3 = colors.base0A;
            regular4 = colors.base0D;
            regular5 = colors.base0E;
            regular6 = colors.base0C;
            regular7 = colors.base05;

            bright0 = colors.base03;
            bright1 = colors.base09;
            bright2 = colors.base01;
            bright3 = colors.base02;
            bright4 = colors.base04;
            bright5 = colors.base06;
            bright6 = colors.base0F;
            bright7 = colors.base07;
         };
      };
   };
}
