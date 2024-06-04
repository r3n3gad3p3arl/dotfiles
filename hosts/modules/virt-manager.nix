{ lib, pkgs, config, ... }:
let
  virt-manager = config.programs.virt-manager.enable;
in {
  environment.systemPackages = lib.mkIf virt-manager (with pkgs; [
    spice-gtk
    virtiofsd
  ]);

  virtualisation.libvirtd = {
    enable = lib.mkIf virt-manager true;
    qemu.swtpm.enable = true;
  };
}
