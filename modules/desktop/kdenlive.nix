{
  flake.modules.homeManager.kdenlive =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.kdePackages.kdenlive ];
    };
}
