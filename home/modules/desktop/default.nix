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

    # scheme = "${inputs.base16-schemes}/base16/tomorrow-night.yaml";

    # temp fix - upstream formatting breakage
    scheme = {
      name = "Tomorrow Night"; author = "Chris Kempson (http://chriskempson.com)"; variant = "dark";
      base00 = "1d1f21"; base01 = "282a2e"; base02 = "373b41"; base03 = "969896";
      base04 = "b4b7b4"; base05 = "c5c8c6"; base06 = "e0e0e0"; base07 = "ffffff";
      base08 = "cc6666"; base09 = "de935f"; base0A = "f0c674"; base0B = "b5bd68";
      base0C = "8abeb7"; base0D = "81a2be"; base0E = "b294bb"; base0F = "a3685a";
    };

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
      # blender.enable = true;
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
