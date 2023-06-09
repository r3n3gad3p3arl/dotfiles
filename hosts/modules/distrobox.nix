{ lib, config, pkgs, ... }: with lib;
let
   cfg = config.virtualisation.distrobox;
in {
   options.virtualisation.distrobox.enable = mkEnableOption (mdDoc "Distrobox");

   config = mkIf cfg.enable {
      virtualisation.docker.enable = true;
      environment.systemPackages = with pkgs; [ distrobox ];
   };
}
