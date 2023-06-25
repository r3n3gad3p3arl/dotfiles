{ lib, config, pkgs, ... }: with lib;
let
   cfg = config.virtualisation.distrobox;
in {
   options.virtualisation.distrobox = {
      enable = mkEnableOption (mdDoc "Distrobox");

      backend = mkOption {
         type = types.enum [ "docker" "podman" ];
         default = "podman";
         example = "docker";
         description = mdDoc "Which container manager to use as a backend for Distrobox.";
      };
   };

   config = mkIf cfg.enable {
      virtualisation = {
         docker.enable = cfg.backend == "docker";
         podman.enable = cfg.backend == "podman";
      };

      environment.systemPackages = with pkgs; [ distrobox ];
   };
}
