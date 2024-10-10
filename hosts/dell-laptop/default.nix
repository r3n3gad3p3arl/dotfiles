{ pkgs, ... }: {
  imports = [ ./hardware.nix ];

  networking.hostName = "dell-laptop";

  services = {
    xserver.videoDrivers = [ "nvidia" ];
    printing.enable = true;
  };

  hardware = {
    nvidia.prime = {
      nvidiaBusId = "PCI:60:0:0";
      intelBusId = "PCI:0:2:0";
    };

    opentabletdriver.enable = true;
  };

  boot = {
    initrd.luks.devices."crypt_root" = {
      device = "/dev/disk/by-uuid/65a72a1d-5da0-4026-a533-6f5d75cf2de1";
      preLVM = true;
    };

    lanzaboote.enable = true;
  };

  security.tpm2.enable = true;

  system = {
    laptop.enable = true;
    stateVersion = "23.05";
  };

  environment.systemPackages = with pkgs; [
    unzrip
    unrar
    _7zz
    bc
    ripgrep
    fd
    ffmpeg
    bchunk
  ];
}
