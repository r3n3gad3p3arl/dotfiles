{ lib, config, pkgs, osConfig, ... }:
let
  hyprland = config.wayland.windowManager.hyprland;
  inherit (lib) meow mkIf;
in {
  imports = meow.mapModules ./.;

  home = mkIf hyprland.enable {
    pointerCursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors-white";
      size = 24;
      gtk.enable = config.gtk.enable;
    };

    packages = with pkgs; [
      playerctl
      brightnessctl
      xdg-utils
      pcmanfm-qt
      grim
      slurp
      libnotify
    ];
  };

  programs = mkIf hyprland.enable {
    quickshell.enable = true;
    hyprlock.enable = true;
  };

  services = mkIf hyprland.enable {
    gammastep.enable = true;
    hyprpaper.enable = true;
  };

  wayland.windowManager.hyprland.systemd.enable = !osConfig.programs.hyprland.withUWSM;
}
