{
  flake.modules.nixos.gaming =
    { lib, config, ... }:
    {
      programs = {
        steam.enable = true;
        gamemode.enable = true;
      };

      environment.sessionVariables.GAMEMODERUNEXEC = lib.mkIf (
        config.hardware.nvidia.enabled
        && config.hardware.nvidia.prime.offload.enable
        && config.hardware.nvidia.prime.offload.enableOffloadCmd
      ) "nvidia-offload";

      networking.firewall = {
        # minecraft lan ports
        allowedUDPPorts = [ 4445 ];

        allowedTCPPortRanges = [
          {
            from = 40000;
            to = 49999;
          }
        ];
      };

      users.users.meow.extraGroups = [ "gamemode" ];
    };

  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        prismlauncher
        mesen
        dolphin-emu
        azahar
        osu-lazer-bin
      ];
    };
}
