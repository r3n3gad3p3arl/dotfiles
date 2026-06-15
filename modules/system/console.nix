{
  flake.modules.nixos.console =
    { pkgs, ... }:
    {
      console = {
        packages = [ pkgs.terminus_font ];
        font = "ter-v16n";
        earlySetup = true;
        keyMap = "us";
      };
    };
}
