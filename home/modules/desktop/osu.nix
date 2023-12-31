{ lib, pkgs, config, ... }: with lib;
let cfg = config.programs.osu-lazer;
in {
  options.programs.osu-lazer.enable = mkEnableOption "osu!";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ osu-lazer-bin ];

    xdg.desktopEntries."osu!" = {
      name = "osu!";
      icon = "osu!";
      exec = "gamemoderun ${pkgs.osu-lazer-bin}/bin/osu!";
      categories = [ "Game" ];
    };
  };
}
