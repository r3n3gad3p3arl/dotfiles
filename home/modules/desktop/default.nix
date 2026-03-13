{
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
let
  cfg = config.home.desktop;
in
{
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
        kdePackages.kdenlive
        prismlauncher
        mesen
        dolphin-emu
        osu-lazer-bin

        # useful tools
        wl-clipboard
        wineWow64Packages.waylandFull
      ];
    };

    programs = {
      firefox.enable = true;
      chromium.enable = true;
      foot.enable = true;
      yt-dlp.enable = true;
      mpv.enable = true;
      obsidian.enable = true;

      keepassxc = {
        enable = true;
        autostart = true;
      };
    };

    wayland.windowManager.hyprland.enable = osConfig.programs.hyprland.enable;

    xdg = {
      enable = true;
      autostart.enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
}
