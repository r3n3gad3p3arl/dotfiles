{ lib, pkgs, config, ... }: with lib;
let
   cfg = config.system.desktop;
in {
   options.system.desktop.enable = mkEnableOption (mdDoc "desktop");

   config = mkIf cfg.enable {
      security = {
         rtkit.enable = true;
         pam.services.swaylock = {};
      };

      services.pipewire = {
         enable = true;

         alsa = {
            enable = true;
            support32Bit = true;
         };

         pulse.enable = true;
         jack.enable = true;
      };

      programs = {
         hyprland.enable = true;
         steam.enable = true;
         gamemode.enable = true;
      };

      fonts = {
         fonts = with pkgs; [
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
         ];

         fontconfig.defaultFonts = {
            serif = [ "Noto Serif" ];
            sansSerif = [ "Noto Sans" ];
            monospace = [ "Noto Sans Mono" ];
            emoji = [ "Noto Color Emoji" ];
         };
      };
   };
}
