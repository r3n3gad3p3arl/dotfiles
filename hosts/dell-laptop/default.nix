{
   imports = [ ./hardware.nix ];

   networking.hostName = "dell-laptop";

   virtualisation = {
      libvirtd.enable = true;
      distrobox.enable = true;
   };

   system = {
      desktop.enable = true;
      grub.enable = true;
      networkmanager.enable = true;

      nvidia = {
         enable = true;
         enablePrime = true;
      };

      stateVersion = "23.05";
   };
}
