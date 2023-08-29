{ lib, config, pkgs, ... }: with lib;
let hyprland = config.wayland.windowManager.hyprland;
in {
   imports = meow.mapModules ./.;

   home = mkIf hyprland.enable {
      pointerCursor = {
         package = pkgs.capitaine-cursors;
         name = "capitaine-cursors-white";
         size = 24;
         gtk.enable = config.gtk.enable;
         x11.enable = true;
      };

      packages = with pkgs; [
         playerctl
         brightnessctl
         xdg-utils
      ];
   };

   programs = mkIf hyprland.enable {
      rofi.enable = true;
      swaylock.enable = true;
      swww.enable = true;
   };

   services = mkIf hyprland.enable {
      dunst.enable = true;
      swayidle.enable = false; # acting weird right now
   };
}
