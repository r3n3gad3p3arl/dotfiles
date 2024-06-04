{
  mapModules = dir:
    let
      inherit (builtins) attrNames readDir;
    in map (n: dir + "/${n}") (attrNames (removeAttrs (readDir dir) [ "default.nix" ]));
}
