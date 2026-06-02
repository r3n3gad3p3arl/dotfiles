{
  pkgs,
  config,
  ...
}:
{
  imports = [ ./hardware.nix ];

  networking.hostName = "dell-laptop";

  services = {
    xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];
    printing.enable = true;
  };

  hardware = {
    nvidia = {
      prime = {
        nvidiaBusId = "PCI:60@0:0:0";
        intelBusId = "PCI:0@0:2:0";
      };

      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      open = false;
    };

    bluetooth.enable = true;
  };

  boot = {
    initrd.luks.devices."crypt_root" = {
      device = "/dev/disk/by-uuid/27b9dfa3-2048-42c9-865a-c800ed3f2094";
      preLVM = true;
      allowDiscards = true;
    };

    # lanzaboote.enable = true;

    zswap.enable = true;
  };

  security.tpm2.enable = true;

  system = {
    laptop.enable = true;
    stateVersion = "23.05";
  };

  environment.systemPackages = with pkgs; [
    unzipNLS
    libqalculate
  ];
}
