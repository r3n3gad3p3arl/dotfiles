{ lib, config, inputs, outputs, ... }: {
   imports = [
      ./hardware.nix
      outputs.nixosModules.distrobox
      outputs.nixosModules.gnome-network-displays
   ];

   networking.hostName = "dell-laptop";

   virtualisation = {
      libvirtd.enable = true;
      distrobox.enable = true;
   };

   programs.gnome-network-displays.enable = true;

   services.xserver.videoDrivers = [ "nvidia" ];

   hardware.nvidia.prime = {
      nvidiaBusId = "PCI:60:0:0";
      intelBusId = "PCI:0:2:0";
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
}
