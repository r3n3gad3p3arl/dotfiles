{ lib, pkgs, config, ... }: with lib; 
let
   virt-manager = config.programs.virt-manager.enable;
in {
   environment.systemPackages = mkIf virt-manager (with pkgs; [
      spice-gtk
      virtiofsd
   ]);

   virtualisation.libvirtd.enable = mkIf virt-manager true;
}
