{ pkgs }:
let
  inherit (pkgs) writeShellScript;
in {
  bin = {
    brightness = writeShellScript "brightness" (builtins.readFile ../bin/brightness.sh);
    volume = writeShellScript "volume" (builtins.readFile ../bin/volume.sh);
    screenshot = writeShellScript "screenshot" (builtins.readFile ../bin/screenshot.sh);
    music = writeShellScript "music" (builtins.readFile ../bin/music.sh);
  };
}
