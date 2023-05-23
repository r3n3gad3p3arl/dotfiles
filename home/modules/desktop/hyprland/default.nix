{ pkgs, ... }: {
   imports = [ ./hyprland.nix ];

   home.packages = with pkgs; [
      wl-clipboard
      hyprpaper
      playerctl
      brightnessctl
      swayidle
   ];
   
   xdg.configFile."hypr/hyprpaper.conf".text =
   let wp = ../../../wallpapers/asukarei.jpg;
   in ''
      preload = ${wp}
      wallpaper = eDP-1,${wp}
   '';
}
