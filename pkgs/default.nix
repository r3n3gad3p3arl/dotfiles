{ pkgs }:
let
  inherit (pkgs) writeShellScript;
in {
  bin = {
    screenshot = writeShellScript "screenshot" (builtins.readFile ../bin/screenshot.sh);
    music = writeShellScript "music" (builtins.readFile ../bin/music.sh);
  };
}
