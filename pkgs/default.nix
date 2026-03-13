{ pkgs, lib, ... }:
{
  bin = builtins.listToAttrs (
    map (n: rec {
      name = lib.removeSuffix ".sh" (baseNameOf n);
      value = pkgs.writeShellScript name (builtins.readFile n);
    }) (lib.meow.mapModules ../bin)
  );
}
