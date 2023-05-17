{ inputs, config, pkgs, ... }: {
   imports = [
      ./hardware.nix
      ../modules/common.nix
      ../modules/grub.nix
      ../modules/networkmanager.nix
      ../modules/nvidia.nix
      ../modules/desktop.nix
   ];

   networking.hostName = "dell-laptop";
   virtualisation.libvirtd.enable = true;
   system.stateVersion = "23.05";
}
