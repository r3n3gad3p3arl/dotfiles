{ config, pkgs, ... }: {
   home.packages = with pkgs; [
      wl-clipboard
      hyprpaper
      playerctl
      brightnessctl
      swayidle
   ];

   programs.eww = {
      enable = true;
      package = pkgs.eww-wayland;
      configDir = ../../config/eww;
   };

   xdg.configFile."hypr/hyprland.conf".text = ''
      monitor = eDP-1,preferred,auto,auto

      exec-once = hyprpaper
      exec-once = mako
      exec-once = swayidle -w before-sleep "swaylock" idlehint 120
      exec-once = hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}

      env = XCURSOR_SIZE,${toString config.home.pointerCursor.size}

      general {
         gaps_in = 2
         gaps_out = 4
         border_size = 2
         col.active_border = rgb(969896)
         col.inactive_border = rgb(4d5057)
         layout = dwindle
      }

      decoration {
         rounding = 4
         drop_shadow = no
      }

      animations {
         animation = global,1,4,default
      }

      $mod = SUPER

      bind = $mod,Return,exec,alacritty
      bind = $mod,R,exec,$(tofi-drun)
      bind = $mod,B,exec,firefox
      bind = $mod CTRL,L,exec,swaylock

      bind = $mod SHIFT,C,killactive,
      bind = $mod SHIFT,Q,exit,
      bind = $mod,F,togglefloating,
      bind = $mod,M,fullscreen, 0

      bind = $mod,H,movefocus, l
      bind = $mod,L,movefocus, r
      bind = $mod,K,movefocus, u
      bind = $mod,J,movefocus, d

      bind = $mod SHIFT,H,movewindow, l
      bind = $mod SHIFT,L,movewindow, r
      bind = $mod SHIFT,K,movewindow, u
      bind = $mod SHIFT,J,movewindow, d

      bind = $mod CTRL,R,submap,resize
      submap = resize
      binde = ,H,resizeactive,-10 0
      binde = ,L,resizeactive,10 0
      binde = ,K,resizeactive,0 -10
      binde = ,J,resizeactive,0 10
      bind = ,escape,submap,reset
      submap = reset

      bind = $mod,1,workspace, 1
      bind = $mod,2,workspace, 2
      bind = $mod,3,workspace, 3
      bind = $mod,4,workspace, 4

      bind = $mod SHIFT,1,movetoworkspace,1
      bind = $mod SHIFT,2,movetoworkspace,2
      bind = $mod SHIFT,3,movetoworkspace,3
      bind = $mod SHIFT,4,movetoworkspace,4

      bindm = $mod,mouse:272,movewindow
      bindm = $mod,mouse:273,resizewindow

      bindle = ,XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 4%+
      bindle = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-
      bindl = ,XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl = ,XF86AudioPlay,exec,playerctl play-pause

      bindle = ,XF86MonBrightnessUp,exec,brightnessctl set 4%+
      bindle = ,XF86MonBrightnessDown,exec,brightnessctl set 4%-
   '';

   xdg.configFile."hypr/hyprpaper.conf".text =
   let
      wp = ../../wallpapers/snotacon.jpg;
   in ''
      preload = ${wp}
      wallpaper = eDP-1,${wp}
   '';
}
