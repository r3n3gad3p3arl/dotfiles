{ lib, config, pkgs, ... }:
let
  inherit (config.programs) hyprland;
in {
  security.pam.services.hyprlock = lib.mkIf hyprland.enable {};

  xdg.portal = {
    enable = true;

    lxqt = {
      enable = hyprland.enable;

      styles = with pkgs; [
        kdePackages.breeze
      ];
    };

    config.hyprland."org.freedesktop.impl.portal.FileChooser" = [ "lxqt" ];
  };

  programs.hyprland.withUWSM = true;
}
