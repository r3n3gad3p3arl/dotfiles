{ config, outputs, ... }: {
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

   # swapfile
   boot = {
      kernelParams = [ "resume_offset=8298496" ];
      resumeDevice = config.fileSystems."/".device;
   };

   swapDevices = [{ device = "/swapfile"; size = 16*1024; }];

   system = {
      laptop.enable = true;
      stateVersion = "23.05";
   };
}
