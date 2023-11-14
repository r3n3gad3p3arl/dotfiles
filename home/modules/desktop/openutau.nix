{ lib, pkgs, config, ... }: with lib;
let cfg = config.programs.openutau;
in {
   options.programs.openutau.enable = mkEnableOption "OpenUtau";

   config = mkIf cfg.enable {
      home.packages = with pkgs; [ openutau ];

      xdg.desktopEntries."openutau" = {
         name = "OpenUtau";
         icon = "openutau";
         exec = "${pkgs.openutau}/bin/OpenUtau";
         categories = [ "AudioVideo" "Audio" "Midi" ];
      };
   };
}
