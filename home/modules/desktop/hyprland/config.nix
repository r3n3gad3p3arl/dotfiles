{ config, inputs, ... }: {
   wayland.windowManager.hyprland.settings =
   let
      cursor = config.home.pointerCursor;
      colors = config.colorScheme.colors;
      bin = ../../bin;
   in {
      monitor = ",preferred,auto,auto";

      exec-once = [
         "sleep 1 && swww init" # workaround for bug where cached wallpaper doesn't load
         "foot --server"
         "hyprctl setcursor ${cursor.name} ${toString cursor.size}"
      ];

      general = {
         gaps_in = 0;
         gaps_out = 0;
         border_size = 1;
         "col.active_border" = "rgb(${colors.base03})";
         "col.inactive_border" = "rgb(${colors.base01})";
         layout = "dwindle";
      };

      decoration = {
         rounding = 0;
         drop_shadow = "no";
      };

      animations = {
         animation = "global,1,4,default";
      };

      "$mod" = "SUPER";

      bind = [
         "$mod,Return,exec,footclient"
         "$mod,R,exec,rofi -show drun"
         "$mod,B,exec,firefox"
         "$mod,Escape,exec,swaylock -fi $(${bin + /wallpaper.sh} get_random_wallpaper ${../../wallpapers})"
         "$mod,W,exec,swww img $(${bin + /wallpaper.sh} get_random_wallpaper ${../../wallpapers})"

         "$mod SHIFT,C,killactive,"
         "$mod SHIFT,Q,exit,"
         "$mod,F,togglefloating,"
         "$mod,M,fullscreen,0"

         "$mod,H,movefocus,l"
         "$mod,L,movefocus,r"
         "$mod,K,movefocus,u"
         "$mod,J,movefocus,d"

         "$mod SHIFT,H,movewindow,l"
         "$mod SHIFT,L,movewindow,r"
         "$mod SHIFT,K,movewindow,u"
         "$mod SHIFT,J,movewindow,d"

         "$mod,T,exec,notify-send 'Date/Time' \"$(date)\""
         "$mod,P,exec,${bin + /battery.sh} send_current_battery_notif"
         "$mod SHIFT,M,exec,mpv 'https://youtube.com/playlist?list=PLksUtCwP9dNDw7oixTORlap_fsNHM2bf9' --shuffle --no-video"

         ",switch:on:Lid Switch,exec,swaylock -fi $(${bin + /wallpaper.sh} get_random_wallpaper ${../../wallpapers})"

         "$mod,O,exec,sleep 1 && hyprctl dispatch dpms toggle"
      ];

      bindl = [
         ",XF86AudioMute,exec,${bin + /volume.sh} toggle_volume_mute"

         ",XF86AudioPlay,exec,playerctl play-pause"
         "$mod,period,exec,playerctl next"
         "$mod,comma,exec,playerctl previous"
         "$mod,S,exec,playerctl stop"
      ];

      bindle = [
         ",XF86AudioRaiseVolume,exec,${bin + /volume.sh} raise_volume"
         ",XF86AudioLowerVolume,exec,${bin + /volume.sh} lower_volume"

         ",XF86MonBrightnessUp,exec,${bin + /brightness.sh} raise_brightness"
         ",XF86MonBrightnessDown,exec,${bin + /brightness.sh} lower_brightness"
      ];

      bindm = [
         "$mod,mouse:272,movewindow"
         "$mod,mouse:273,resizewindow"
      ];
   };

   wayland.windowManager.hyprland.extraConfig = ''
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
   '';
}
