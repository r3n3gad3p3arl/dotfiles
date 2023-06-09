{ pkgs, lib, config, osConfig, ... }: with lib;
let cfg = config.programs.osu-lazer;
in {
   options.programs.osu-lazer.enable = mkEnableOption (mdDoc "osu!");

   config = mkIf cfg.enable {
      home.packages = with pkgs; [ osu-lazer-bin ];

      xdg.desktopEntries."osu!" = {
         name = "osu!";
         exec = (if osConfig.system.nvidia.enablePrime then "nvidia-offload " else "") + "gamemoderun ${pkgs.osu-lazer-bin}/bin/osu!";
         categories = [ "Game" ];
      };
   };
}
