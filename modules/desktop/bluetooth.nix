{
  flake.modules.nixos.bluetooth = {
    hardware.bluetooth.enable = true;
  };

  flake.modules.homeManager.bluetooth = {
    services.mpris-proxy.enable = true;
  };
}
