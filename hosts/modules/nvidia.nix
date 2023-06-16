{ lib, config, ... }: with lib;
let
   cfg = config.system.nvidia;
in {
   options.system.nvidia = {
      enable = mkEnableOption (mdDoc "NVIDIA drivers");
      enablePrime = mkEnableOption (mdDoc "prime offloading");
   };
   
   config = mkIf cfg.enable {
      hardware = {
         nvidia = {
            modesetting.enable = true;

            prime = mkIf cfg.enablePrime {
               offload = {
                  enable = true;
                  enableOffloadCmd = true;
               };

               nvidiaBusId = "PCI:60:0:0";
               intelBusId = "PCI:0:2:0";
            };

            powerManagement = {
               enable = true;
               finegrained = true;
            };
         };
      };

      services.xserver.videoDrivers = [ "nvidia" ];
      programs.hyprland.nvidiaPatches = true;
   };
}
