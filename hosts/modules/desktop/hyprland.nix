{ lib, config, pkgs, ... }:
let
  inherit (config.programs) hyprland;
in {
  security.pam.services.hyprlock = lib.mkIf hyprland.enable {};

  xdg.portal = {
    enable = true;
    extraPortals = lib.mkIf hyprland.enable [ pkgs.xdg-desktop-portal-gtk ];
  };
}
