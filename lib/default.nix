{
   mapModules = dir: with builtins;
      map (n: dir + "/${n}") (attrNames (removeAttrs (readDir dir) [ "default.nix" ]));
}
