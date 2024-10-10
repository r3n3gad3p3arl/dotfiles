{ lib, pkgs, config, ... }:
let
  inherit (config.programs) virt-manager;
in {
  environment.systemPackages = lib.mkIf virt-manager.enable (with pkgs; [
    spice-gtk
    virtiofsd
  ]);

  virtualisation.libvirtd = {
    enable = virt-manager.enable;
    qemu.swtpm.enable = true;
  };
}
