{ lib, config, ... }:
let
  cfg = config.system.laptop;
  inherit (lib) mkEnableOption mkIf mkDefault;
in {
  options.system.laptop.enable = mkEnableOption "laptop configuration";

  config = mkIf cfg.enable {
    system.desktop.enable = mkDefault true;
    networking.networkmanager.enable = mkDefault true;

    services = {
      logind.lidSwitch = mkDefault "hibernate";
      upower.enable = mkDefault true;
    };
  };
}
