{
  flake.modules.nixos.intelGpu =
    { pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "modesetting" ];

      hardware.graphics.extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime-legacy1
      ];
    };
}
