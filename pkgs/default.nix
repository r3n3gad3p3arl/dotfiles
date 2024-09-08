{ pkgs }:
let
  inherit (pkgs) writeShellScript;
in {
  bin = {
    battery = writeShellScript "battery" (builtins.readFile ../bin/battery.sh);
    brightness = writeShellScript "brightness" (builtins.readFile ../bin/brightness.sh);
    volume = writeShellScript "volume" (builtins.readFile ../bin/volume.sh);
    screenshot = writeShellScript "screenshot" (builtins.readFile ../bin/screenshot.sh);
    music = writeShellScript "music" (builtins.readFile ../bin/music.sh);
    util = writeShellScript "util" (builtins.readFile ../bin/util.sh);
  };
}
