{ pkgs, lib, inputs, config, ... }: {
   imports = lib.meow.mapModules { dir = ./.; extraModules = [ inputs.nix-colors.homeManagerModules.default ]; };

   fonts.fontconfig.enable = true;
   colorScheme = inputs.nix-colors.colorSchemes.tomorrow-night;

   home = {
      pointerCursor = {
         package = pkgs.capitaine-cursors;
         name = "capitaine-cursors-white";
         size = 24;
         gtk.enable = true;
      };

      packages = with pkgs; [
         # media
         krita
         gimp
         lmms

         # useful tools
         keepassxc
         virt-manager

         # wm utils
         wl-clipboard
         swayidle
         swaybg
         playerctl
         brightnessctl

         # fonts
         dina-font
         cozette
         unifont
      ];
   };

   gtk = {
      enable = true;

      font = {
         name = "Dina";
         size = 11;
      };

      theme =
      let contrib = inputs.nix-colors.lib.contrib { inherit pkgs; };
      in {
         package = contrib.gtkThemeFromScheme { scheme = config.colorScheme; };
         name = config.colorScheme.slug;
      };
   };

   xdg = {
      enable = true;

      userDirs = {
         enable = true;
         createDirectories = true;
      };
   };
}
