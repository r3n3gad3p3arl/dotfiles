{ lib, pkgs, config, ... }:
let cfg = config.programs.openutau;
in {
  options.programs.openutau.enable = lib.mkEnableOption "OpenUtau";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ openutau ];

    xdg.desktopEntries."openutau" = {
      name = "OpenUtau";
      exec = "${pkgs.openutau}/bin/OpenUtau";
      categories = [ "AudioVideo" "Audio" "Midi" ];
    };
  };
}
