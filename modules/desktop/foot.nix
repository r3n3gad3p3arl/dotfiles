{
  flake.modules.homeManager.foot =
    { pkgs, config, ... }:
    {
      programs.foot = {
        enable = true;
        server.enable = true;

        settings = {
          main = {
            font = "${builtins.elemAt config.fonts.fontconfig.defaultFonts.monospace 0}:size=11,Symbols Nerd Font:size=11";
            pad = "8x8";
          };

          colors-dark = {
            background = config.colors.base00;
            foreground = config.colors.base05;

            regular0 = config.colors.base01;
            regular1 = config.colors.base08;
            regular2 = config.colors.base0B;
            regular3 = config.colors.base0A;
            regular4 = config.colors.base0D;
            regular5 = config.colors.base0E;
            regular6 = config.colors.base0C;
            regular7 = config.colors.base06;

            bright0 = config.colors.base02;
            bright1 = config.colors.base08;
            bright2 = config.colors.base0B;
            bright3 = config.colors.base0A;
            bright4 = config.colors.base0D;
            bright5 = config.colors.base0E;
            bright6 = config.colors.base0C;
            bright7 = config.colors.base07;

            "16" = config.colors.base09;
            "17" = config.colors.base0F;
            "18" = config.colors.base01;
            "19" = config.colors.base02;
            "20" = config.colors.base04;
            "21" = config.colors.base06;
          };
        };
      };

      home.packages = [ pkgs.libsixel ];
      systemd.user.services.foot.Service.Slice = "app-graphical.slice";

      xdg.configFile."xdg-terminals.list".text = ''
        footclient.desktop
        foot.desktop
      '';
    };
}
