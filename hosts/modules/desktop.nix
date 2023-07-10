{ lib, pkgs, config, inputs, ... }: with lib;
let
   cfg = config.system.desktop;
in {
   imports = [ inputs.aagl.nixosModules.default ];

   options.system.desktop.enable = mkEnableOption (mdDoc "desktop configuration");

   config = mkIf cfg.enable {
      nix.settings = inputs.aagl.nixConfig;

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
         anime-game-launcher.enable = true;
      };

      fonts = {
         fonts = with pkgs; [
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            dina-font
            cozette
            unifont
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
