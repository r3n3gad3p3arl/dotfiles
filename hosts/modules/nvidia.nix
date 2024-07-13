{ lib, config, ... }: {
  hardware.nvidia = {
    modesetting.enable = true;

    prime.sync.enable = true;

    # prime.offload = {
      # enable = config.system.laptop.enable;
      # enableOffloadCmd = true;
    # };
  };

  # environment.sessionVariables = lib.mkIf config.programs.gamemode.enable {
    # GAMEMODERUNEXEC = lib.mkIf config.hardware.nvidia.prime.offload.enableOffloadCmd "nvidia-offload";
  # };
}
