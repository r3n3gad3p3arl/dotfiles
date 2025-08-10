{ lib, config, osConfig, pkgs, ... }:
let
  cfg = config.home.desktop;
in {
  imports = lib.meow.mapModules ./.;

  options.home.desktop.enable = lib.mkEnableOption "desktop configuration";

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    gtk.enable = true;
    qt.enable = true;

    home = {
      packages = with pkgs; [
        # media
        gimp3
        prismlauncher
        osu-lazer-bin

        # useful tools
        wl-clipboard
        wineWowPackages.waylandFull
      ];
    };

    programs = {
      firefox.enable = true;

      chromium = {
        enable = true;

        package = pkgs.chromium.override {
          enableWideVine = true;
        };
      };

      foot.enable = true;
      yt-dlp.enable = true;
      mpv.enable = true;
      keepassxc.enable = true;
      obsidian.enable = true;
    };

    wayland.windowManager.hyprland.enable = osConfig.programs.hyprland.enable;

    xdg = {
      enable = true;

      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
}
