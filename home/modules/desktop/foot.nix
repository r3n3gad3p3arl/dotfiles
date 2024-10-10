{ lib, config, pkgs, ... }: {
  home.packages = lib.mkIf config.programs.foot.enable [ pkgs.libsixel ];

  programs.foot = {
    server.enable = true;

    settings = {
      main = {
        font = "JetBrains Mono:size=11,Symbols Nerd Font:size=11";
        pad = "8x8";
      };

      colors =
      let colors = config.scheme;
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

        bright0 = colors.base02;
        bright1 = colors.base08;
        bright2 = colors.base0B;
        bright3 = colors.base0A;
        bright4 = colors.base0D;
        bright5 = colors.base0E;
        bright6 = colors.base0C;
        bright7 = colors.base07;

        "16" = colors.base09;
        "17" = colors.base0F;
        "18" = colors.base01;
        "19" = colors.base02;
        "20" = colors.base04;
        "21" = colors.base06;
      };
    };
  };
}
