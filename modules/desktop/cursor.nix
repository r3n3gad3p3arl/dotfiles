{
  flake.modules.homeManager.cursor =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors-white";
        size = 24;
      };
    };
}
