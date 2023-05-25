{ pkgs, ... }: {
   imports = [
      ./foot.nix
      ./rofi
      ./firefox
      ./dunst.nix
      ./swaylock.nix
      ./mpv.nix
      ./hyprland
      #./osu.nix
   ];

   fonts.fontconfig.enable = true;

   home = {
      pointerCursor = {
         package = pkgs.capitaine-cursors;
         name = "capitaine-cursors-white";
         size = 24;
         gtk.enable = true;
      };

      packages = with pkgs; [
         krita
         gimp
         keepassxc
         virt-manager
         wl-clipboard
         swayidle
         playerctl
         brightnessctl

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

      theme = {
         package = pkgs.materia-theme;
         name = "Materia-dark";
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
