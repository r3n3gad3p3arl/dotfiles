{ pkgs, lib, ... }:
{
  bin =
    let
      shellScriptDeriv =
        name: deps:
        pkgs.stdenvNoCC.mkDerivation {
          inherit name;
          src = ../bin;
          nativeBuildInputs = [ pkgs.makeWrapper ];

          installPhase = ''
            install -D --target-directory=$out/bin/ ${name}.sh

            wrapProgram $out/bin/${name}.sh \
              --prefix PATH : ${lib.makeBinPath deps}
          '';

          meta.mainProgram = "${name}.sh";
        };
    in
    {
      music = shellScriptDeriv "music" [
        pkgs.xdg-utils
      ];

      screenshot = shellScriptDeriv "screenshot" [
        pkgs.coreutils
        pkgs.jq
        pkgs.grim
        pkgs.slurp
        pkgs.libnotify
      ];

      autoclicker = shellScriptDeriv "autoclicker" [
        pkgs.ydotool
      ];
    };
}
