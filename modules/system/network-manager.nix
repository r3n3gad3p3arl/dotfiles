{
  flake.modules.nixos.networkManager = {
    networking.networkmanager.enable = true;
    users.users.meow.extraGroups = [ "networkmanager" ];
  };
}
