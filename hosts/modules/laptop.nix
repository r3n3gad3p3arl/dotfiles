{ lib, config, ... }: with lib;
let cfg = config.system.laptop;
in {
   options.system.laptop.enable = mkEnableOption (mdDoc "laptop configuration");

   config = mkIf cfg.enable {
      # most laptops are going to be used as desktop systems
      system.desktop.enable = mkDefault true;

      # network manager is most useful for portable devices
      networking.networkmanager.enable = mkDefault true;

      # slows down boot time + unecessary for local booting
      systemd.services."NetworkManager-wait-online".enable = mkDefault false;

      # i prefer hibernation on lid close
      services.logind.lidSwitch = mkDefault "hibernate";
   };
}
