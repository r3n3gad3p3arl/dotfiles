{ inputs, pkgs, config, ... }: {
   gtk = {
      font = {
         name = "Noto Sans";
         size = 11;
      };

      theme = let contrib = inputs.nix-colors.lib.contrib { inherit pkgs; };
      in {
         package = contrib.gtkThemeFromScheme { scheme = config.colorScheme; };
         name = config.colorScheme.slug;
      };

      gtk3.extraConfig = {
         gtk-application-prefer-dark-theme = true;
      };

      gtk4.extraConfig = {
         gtk-application-prefer-dark-theme = true;
      };

      iconTheme = {
         name = "Colloid";
         package = pkgs.colloid-icon-theme;
      };
   };
}
