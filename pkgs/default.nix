{ pkgs }: with pkgs; {
   bin = {
      battery = writeShellScript "battery" (builtins.readFile ../bin/battery.sh);
      brightness = writeShellScript "brightness" (builtins.readFile ../bin/brightness.sh);
      volume = writeShellScript "volume" (builtins.readFile ../bin/volume.sh);
      wallpaper = writeShellScript "wallpaper" (builtins.readFile ../bin/wallpaper.sh);
   };
}
