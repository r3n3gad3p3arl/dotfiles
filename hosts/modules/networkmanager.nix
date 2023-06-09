{ lib, config, ... }: with lib;
let
   cfg = config.system.networkmanager;
in {
   options.system.networkmanager.enable = mkEnableOption (mdDoc "Network Manager");

   config = mkIf cfg.enable {
      networking.networkmanager.enable = true;

      # slows down boot time + unecessary for local booting
      systemd.services."NetworkManager-wait-online".enable = false;
   };
}
