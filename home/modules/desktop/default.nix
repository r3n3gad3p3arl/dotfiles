{ pkgs, lib, inputs, config, osConfig, ... }: with lib;
let
   cfg = config.home.desktop;
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
         pointerCursor = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 24;
            gtk.enable = config.gtk.enable;
            x11.enable = true;
         };

         packages = with pkgs; [
            # media
            krita
            gimp
            lmms

            # useful tools
            keepassxc
            virt-manager

            # wm utils
            wl-clipboard
            playerctl
            brightnessctl
         ];

         sessionVariables = lib.mkIf osConfig.programs.gamemode.enable {
            GAMEMODERUNEXEC = "nvidia-offload";
         };
      };

      programs = {
         firefox.enable = true;
         chromium.enable = true;
         rofi.enable = true;
         foot.enable = true;
         yt-dlp.enable = true;
         mpv.enable = true;
         osu-lazer.enable = true;
         swaylock.enable = true;
         swww.enable = true;
      };

      services = {
         dunst.enable = true;
         swayidle.enable = true;
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
