{ lib, config, pkgs, ... }:
let hyprland = config.programs.hyprland;
in {
   security.pam.services.swaylock = lib.mkIf hyprland.enable {};
   xdg.portal.extraPortals = lib.mkIf hyprland.enable [ pkgs.xdg-desktop-portal-gtk ];
}
