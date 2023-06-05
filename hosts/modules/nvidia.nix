{
   hardware = {
      nvidia = {
         modesetting.enable = true;

         prime = {
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
   powerManagement.cpuFreqGovernor = "performance";
}
