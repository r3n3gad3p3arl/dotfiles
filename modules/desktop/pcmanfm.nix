{
  flake.modules.nixos.pcmanfm = {
    services.gvfs.enable = true;
  };

  flake.modules.homeManager.pcmanfm =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.pcmanfm-qt ];
    };
}
