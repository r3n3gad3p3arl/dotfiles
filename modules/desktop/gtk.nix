{
  flake.modules.homeManager.gtk =
    { pkgs, config, ... }:
    {
      gtk = {
        enable = true;

        font = {
          name = builtins.elemAt config.fonts.fontconfig.defaultFonts.sansSerif 0;
          size = 11;
        };

        theme = {
          name = "Breeze-Dark";
          package = pkgs.kdePackages.breeze-gtk;
        };

        iconTheme = {
          name = "Colloid-Dark";
          package = pkgs.colloid-icon-theme;
        };

        gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
        gtk4.theme = config.gtk.theme;
      };

      dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
      home.pointerCursor.gtk.enable = true;
    };
}
