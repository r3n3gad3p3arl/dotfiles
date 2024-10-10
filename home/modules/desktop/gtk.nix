{ pkgs, ... }: {
  gtk = {
    font = {
      name = "Rubik";
      size = 11;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  # dconf.settings = {
  #   "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  # };
}
