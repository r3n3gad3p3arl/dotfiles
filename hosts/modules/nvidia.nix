{ lib, config, ... }: {
   hardware.nvidia = {
      modesetting.enable = true;

      prime.offload = {
         enable = config.system.laptop.enable;
         enableOffloadCmd = config.hardware.nvidia.prime.offload.enable;
      };

      powerManagement = {
         enable = true;
         finegrained = config.hardware.nvidia.prime.offload.enable;
      };
   };
}
