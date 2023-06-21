{ pkgs, lib, inputs, config, osConfig, ... }: with lib;
let
   cfg = config.home.desktop;
in {
   imports = [
      inputs.nix-colors.homeManagerModules.default
      inputs.hyprland.homeManagerModules.default
   ] ++ meow.mapModules ./.;

   options.home.desktop.enable = mkEnableOption (mdDoc "desktop configuration");

   config = mkIf cfg.enable {
      fonts.fontconfig.enable = true;
      colorScheme = inputs.nix-colors.colorSchemes.tomorrow-night;

      home = {
         pointerCursor = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 24;
            gtk.enable = true;
         };

         sessionVariables = {
            SWWW_TRANSITION = "wipe";
            SWWW_TRANSITION_DURATION = 0.8;
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
            swww
            playerctl
            brightnessctl
         ];
      };

      programs = {
         firefox.enable = true;
         rofi.enable = true;
         foot.enable = true;
         yt-dlp.enable = true;
         mpv.enable = true;
         osu-lazer.enable = true;
         swaylock.enable = true;
      };

      services = {
         dunst.enable = true;
         swayidle.enable = true;
      };

      wayland.windowManager.hyprland.enable = osConfig.programs.hyprland.enable;

      gtk = {
         enable = true;

         font = {
            name = "Noto Sans";
            size = 11;
         };

         theme =
         let contrib = inputs.nix-colors.lib.contrib { inherit pkgs; };
         in {
            package = contrib.gtkThemeFromScheme { scheme = config.colorScheme; };
            name = config.colorScheme.slug;
         };
      };

      xdg = {
         enable = true;

         userDirs = {
            enable = true;
            createDirectories = true;
         };
      };
   };
}
