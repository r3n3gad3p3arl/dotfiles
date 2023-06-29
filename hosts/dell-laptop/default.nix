{ lib, config, inputs, outputs, ... }: {
   imports = [
      ./hardware.nix
      outputs.nixosModules.distrobox
      outputs.nixosModules.gnome-network-displays
   ];

   # uncreative but descriptive
   networking.hostName = "dell-laptop";

   virtualisation = {
      # for playing in my sandbox :)
      libvirtd.enable = true;

      # for packages that aren't in nixpkgs and i can't figure out how to package myself
      distrobox.enable = true;
   };

   # for laggily casting to my tv until i get an hdmi cable
   programs.gnome-network-displays.enable = true;

   # i'm a fool who bought a laptop before they got into linux :(
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

   system = {
      laptop.enable = true;
      stateVersion = "23.05";
   };
}
