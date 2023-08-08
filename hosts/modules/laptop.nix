{ lib, config, ... }: with lib;
let cfg = config.system.laptop;
in {
   options.system.laptop.enable = mkEnableOption "laptop configuration";

   config = mkIf cfg.enable {
      system.desktop.enable = mkDefault true;
      networking.networkmanager.enable = mkDefault true;
      services.logind.lidSwitch = mkDefault "hibernate";
   };
}
