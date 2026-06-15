{ inputs, ... }:
{
  flake.modules.nixos.dell-laptop =
    { config, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        system
        desktop
        gaming
        intelGpu
        laptop
        networkManager
        nvidia
        printing
      ];

      networking.hostName = "dell-laptop";

      hardware.nvidia = {
        prime = {
          nvidiaBusId = "PCI:60@0:0:0";
          intelBusId = "PCI:0@0:2:0";
        };

        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
        open = false;
      };

      boot.initrd.luks.devices."crypt_root" = {
        device = "/dev/disk/by-uuid/27b9dfa3-2048-42c9-865a-c800ed3f2094";
        preLVM = true;
        allowDiscards = true;
      };

      home-manager.users.meow.imports = with inputs.self.modules.homeManager; [
        system
        desktop
        laptop
        gaming
        kdenlive
      ];
    };
}
