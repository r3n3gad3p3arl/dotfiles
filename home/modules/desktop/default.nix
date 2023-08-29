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
         packages = with pkgs; [
            # media
            krita
            gimp
            lmms
            libsForQt5.kdenlive
            libsForQt5.kate
            openutau
            calibre

            # useful tools
            keepassxc
            virt-manager
            wl-clipboard
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
         osu-lazer.enable = true;
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
