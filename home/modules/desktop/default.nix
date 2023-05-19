{ pkgs, ... }: {
   imports = [
      ./foot.nix
      ./rofi.nix
      ./firefox
      ./mako.nix
      ./swaylock.nix
      ./mpv.nix
      ./hyprland.nix
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
         osu-lazer-bin
         keepassxc
         virt-manager
         fantasque-sans-mono
         #envypn-font
         dina-font
         cozette
         unifont
         #(nerdfonts.override { fonts = [ "FantasqueSansMono" "NerdFontsSymbolsOnly" ]; })
      ];
   };

   xdg = {
      enable = true;

      userDirs = {
         enable = true;
         createDirectories = true;
      };
   };
}
