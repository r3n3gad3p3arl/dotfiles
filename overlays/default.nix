{ pkgs, meowPkgs, ... }: {
  meowPkgs = final: prev: {
    meowPkgs = meowPkgs;
  };

  mpvScripts = final: prev: {
    mpvScripts = prev.mpvScripts.overrideScope (final: prev: {
      notify-send = pkgs.callPackage ../pkgs/mpv-notify-send.nix { buildLua = prev.buildLua; };
    });
  };
}
