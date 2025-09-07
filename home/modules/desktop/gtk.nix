{ pkgs, config, ... }: {
  gtk = {
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
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
