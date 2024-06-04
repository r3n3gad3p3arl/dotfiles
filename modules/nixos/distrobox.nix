{ lib, config, pkgs, ... }:
let
  cfg = config.virtualisation.distrobox;
  inherit (lib) mkEnableOption mkOption types mkIf;
in {
  options.virtualisation.distrobox = {
    enable = mkEnableOption "Distrobox";

    backend = mkOption {
      type = types.enum [ "docker" "podman" ];
      default = "podman";
      example = "docker";
      description = "Which container manager to use as a backend for Distrobox.";
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
