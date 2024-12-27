{ lib, config, osConfig, inputs, pkgs, ... }:
let
  cfg = config.home.desktop;
in {
  imports = [
    inputs.base16.homeManagerModule
  ] ++ lib.meow.mapModules ./.;

  options.home.desktop.enable = lib.mkEnableOption "desktop configuration";

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    gtk.enable = true;

    scheme = "${inputs.base16-schemes}/base16/tomorrow-night.yaml";

    home = {
      packages = with pkgs; [
        # media
        gimp
        qbittorrent
        wiimms-iso-tools
        obsidian
        prismlauncher
        lmms
        kdenlive

        # useful tools
        keepassxc
        wl-clipboard
        wineWowPackages.waylandFull
      ];
    };

    programs = {
      firefox.enable = true;
      chromium.enable = true;
      foot.enable = true;
      yt-dlp.enable = true;
      mpv.enable = true;
      libreoffice.enable = true;
      zathura.enable = true;
      openutau.enable = true;
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
