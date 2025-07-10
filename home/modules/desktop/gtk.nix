{ pkgs, ... }: {
  gtk = {
    font = {
      name = "Rubik";
      size = 11;
    };

    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };
  };
}
