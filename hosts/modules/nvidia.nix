{ lib, config, ... }: {
   hardware.nvidia = {
      modesetting.enable = true;

      prime.offload = {
         # hybrid graphics are usually only present in laptops
         enable = config.system.laptop.enable;
         enableOffloadCmd = config.hardware.nvidia.prime.offload.enable;
      };

      powerManagement = {
         enable = true;
         finegrained = config.hardware.nvidia.prime.offload.enable;
      };
   };
}
