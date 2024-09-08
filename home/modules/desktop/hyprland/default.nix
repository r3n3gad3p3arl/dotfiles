{ lib, config, pkgs, inputs, ... }:
let
  hyprland = config.wayland.windowManager.hyprland;
  inherit (lib) meow mkIf;
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ] ++ meow.mapModules ./.;

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
      pcmanfm
      grim
      slurp
      jq
      libnotify
    ];
  };

  programs = mkIf hyprland.enable {
    ags.enable = true;
    hyprlock.enable = true;
  };

  services = mkIf hyprland.enable {
    # dunst.enable = true;
    gammastep.enable = true;
    hyprpaper.enable = true;
  };
}
