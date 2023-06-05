{
   mapModules = { dir, extraModules ? [], ... }: with builtins;
      concatLists [ extraModules (map (n: dir + "/${n}") (attrNames (removeAttrs (readDir dir) [ "default.nix" ]))) ];
}
