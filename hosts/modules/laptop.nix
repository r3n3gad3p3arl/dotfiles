{ lib, config, ... }: with lib;
let cfg = config.system.laptop;
in {
   options.system.laptop.enable = mkEnableOption (mdDoc "laptop configuration");

   config = mkIf cfg.enable {
      system.desktop.enable = mkDefault true;

      networking.networkmanager.enable = mkDefault true;
      users.users.meow.extraGroups = mkIf config.networking.networkmanager.enable [ "networkmanager" ];

      # slows down boot time + unecessary for local booting
      systemd.services."NetworkManager-wait-online".enable = mkDefault false;

      services.logind.lidSwitch = mkDefault "hibernate";
   };
}
