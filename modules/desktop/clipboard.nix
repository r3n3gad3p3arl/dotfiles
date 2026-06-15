{
  flake.modules.homeManager.clipboard =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.wl-clipboard ];
    };
}
