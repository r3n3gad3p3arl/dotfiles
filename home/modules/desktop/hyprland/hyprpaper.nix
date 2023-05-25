{ pkgs, ... }: {
   home.packages = with pkgs; [ hyprpaper ];
   
   xdg.configFile."hypr/hyprpaper.conf".text =
   let wp = ../../../wallpapers/asukarei.jpg;
   in ''
      preload = ${wp}
      wallpaper = eDP-1,${wp}
   '';
}
