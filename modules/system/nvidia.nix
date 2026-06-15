{
  flake.modules.nixos.nvidia = {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.modesetting.enable = true;
  };
}
