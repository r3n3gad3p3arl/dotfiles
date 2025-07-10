{ lib, pkgs, config, ... }:
let cfg = config.programs.openutau;
in {
  options.programs.openutau.enable = lib.mkEnableOption "OpenUtau";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ openutau ];

    xdg.desktopEntries."openutau" = {
      name = "OpenUtau";
      exec = "${lib.getExe pkgs.openutau}";
      categories = [ "AudioVideo" "Audio" "Midi" ];
    };
  };
}
