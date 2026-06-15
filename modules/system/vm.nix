{
  flake.modules.nixos.vm = {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    users.users.meow.extraGroups = [ "libvirtd" ];
  };
}
