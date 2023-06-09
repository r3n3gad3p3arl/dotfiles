{ config, inputs, ... }: {
   wayland.windowManager.hyprland.extraConfig =
   let
      cursor = config.home.pointerCursor;
      colors = config.colorScheme.colors;
   in ''
      monitor = eDP-1,preferred,auto,auto

      exec-once = swaybg -i ${../../wallpapers/asukarei.jpg} -m fill
      exec-once = dunst
      exec-once = foot --server
      exec-once = swayidle -w before-sleep swaylock idlehint 120
      exec-once = hyprctl setcursor ${cursor.name} ${toString cursor.size}

      env = XCURSOR_SIZE,${toString cursor.size}

      general {
         gaps_in = 0
         gaps_out = 0
         border_size = 1
         col.active_border = rgb(${colors.base03})
         col.inactive_border = rgb(${colors.base01})
         layout = dwindle
      }

      decoration {
         rounding = 0
         drop_shadow = no
      }

      animations {
         animation = global,1,4,default
      }

      $mod = SUPER

      bind = $mod,Return,exec,footclient
      bind = $mod,R,exec,rofi -show drun
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
      bind = ,XF86AudioRaiseVolume,exec,notify-send -h int:value:$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}') "Volume"
      bindle = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-
      bind = ,XF86AudioLowerVolume,exec,notify-send -h int:value:$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}') "Volume"
      bindl = ,XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

      bindl = ,XF86AudioPlay,exec,playerctl play-pause
      bindl = $mod,period,exec,playerctl next
      bindl = $mod,comma,exec,playerctl previous
      bindl = $mod,S,exec,playerctl stop

      bindle = ,XF86MonBrightnessUp,exec,brightnessctl set 4%+
      bindle = ,XF86MonBrightnessDown,exec,brightnessctl set 4%-

      bind = $mod,T,exec,notify-send "Date/Time" "$(date)"
      bind = $mod,P,exec,notify-send -h int:value:$(cat /sys/class/power_supply/BAT0/capacity) "Battery"

      bind = $mod SHIFT,M,exec,mpv "https://youtube.com/playlist?list=PLksUtCwP9dNDw7oixTORlap_fsNHM2bf9" --shuffle --no-video
   '';
}
