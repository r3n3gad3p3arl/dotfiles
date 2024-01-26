{ lib, config, osConfig, inputs, pkgs, ... }: with lib;
let cfg = config.home.desktop;
in {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ] ++ meow.mapModules ./.;

  options.home.desktop.enable = mkEnableOption "desktop configuration";

  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    gtk.enable = true;

    colorScheme = inputs.nix-colors.colorSchemes.tomorrow-night;

    home = {
      packages = with pkgs; [
        # media
        krita
        gimp
        libsForQt5.kdenlive
        calibre
        godot_4
        qbittorrent
        wiimms-iso-tools
        dolphin-emu

        # useful tools
        keepassxc
        wl-clipboard
        wineWowPackages.waylandFull
      ];

      sessionVariables = lib.mkIf osConfig.programs.gamemode.enable {
        GAMEMODERUNEXEC = "nvidia-offload";
      };
    };

    programs = {
      firefox.enable = true;
      chromium.enable = true;
      foot.enable = true;
      yt-dlp.enable = true;
      mpv.enable = true;
      libreoffice.enable = true;
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
