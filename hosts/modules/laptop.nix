{ lib, config, ... }:
let
  cfg = config.system.laptop;
  inherit (lib) mkEnableOption mkIf mkDefault;
in {
  options.system.laptop.enable = mkEnableOption "laptop configuration";

  config = mkIf cfg.enable {
    system.desktop.enable = mkDefault true;

    networking.networkmanager = {
      enable = mkDefault true;
      wifi.powersave = mkDefault true;
    };

    systemd.sleep.extraConfig = "HibernateDelaySec=1h";

    services = {
      logind.lidSwitch = mkDefault "sleep";
      upower.enable = mkDefault true;
      power-profiles-daemon.enable = mkDefault true;
      thermald.enable = mkDefault true;
    };
  };
}
