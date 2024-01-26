{ pkgs, config, inputs, ... }: {
  wayland.windowManager.hyprland.settings = let
    cursor = config.home.pointerCursor;
    colors = config.colorScheme.colors;
    bin = pkgs.meowPkgs.bin;
    wallpapers = ../../../wallpapers;
    pictures = config.xdg.userDirs.pictures;
    workspaces = builtins.concatLists (builtins.genList (x:
      let ws = toString (x + 1);
      in [
        "$mod,${ws},workspace,${ws}"
        "$mod SHIFT,${ws},movetoworkspace,${ws}"
      ]
    ) 9);
  in {
    monitor = [
      "eDP-1,preferred,auto,1" # main monitor
      "DP-1,preferred,auto,2" # secondary monitor
      ",preferred,auto,1" # fallback
    ];

    exec-once = [
      "sleep 1 && swww init" # workaround for cache loading bug
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
      drop_shadow = false;
    };

    animations = {
      animation = "global,1,4,default";
    };

    "$mod" = "SUPER";

    bind = [
      "$mod,Return,exec,foot"
      "$mod,R,exec,rofi -show drun"
      "$mod,B,exec,firefox"
      "$mod,E,exec,emacs"
      "$mod,Space,exec,keepassxc"
      "$mod,Escape,exec,swaylock -fi $(${bin.wallpaper} get_random_wallpaper ${wallpapers})"
      "$mod,W,exec,swww img $(${bin.wallpaper} pick_wallpaper ${wallpapers}) --transition-type wipe --transition-duration 0.8"
      "$mod SHIFT,W,exec,swww img $(${bin.wallpaper} get_random_wallpaper ${wallpapers}) --transition-type wipe --transition-duration 0.8"

      "$mod SHIFT,C,killactive,"
      "$mod SHIFT,Q,exit,"
      "$mod,F,togglefloating,"
      "$mod SHIFT,F,fullscreen,0"

      "$mod,H,movefocus,l"
      "$mod,L,movefocus,r"
      "$mod,K,movefocus,u"
      "$mod,J,movefocus,d"

      "$mod SHIFT,H,movewindow,l"
      "$mod SHIFT,L,movewindow,r"
      "$mod SHIFT,K,movewindow,u"
      "$mod SHIFT,J,movewindow,d"

      "$mod,T,exec,notify-send \"$(date +'%I:%M %p')\" \"$(date +'%a %b %d')\""
      "$mod,P,exec,${bin.battery} send_current_battery_notif"
      "$mod,M,exec,${bin.music} play_song"
      "$mod SHIFT,M,exec,${bin.music} play_shuffle"

      ",Print,exec,${bin.screenshot} print_current_screen ${pictures}"
      "$mod,Print,exec,${bin.screenshot} print_selection ${pictures}"
    ] ++ workspaces;

    bindl = [
      ",XF86AudioMute,exec,${bin.volume} toggle_volume_mute"
      ",XF86AudioPlay,exec,playerctl play-pause"
      "$mod,period,exec,playerctl next"
      "$mod,comma,exec,playerctl previous"
      "$mod,S,exec,playerctl stop"
    ];

    bindle = [
      ",XF86AudioRaiseVolume,exec,${bin.volume} raise_volume"
      ",XF86AudioLowerVolume,exec,${bin.volume} lower_volume"

      ",XF86MonBrightnessUp,exec,${bin.brightness} raise_brightness"
      ",XF86MonBrightnessDown,exec,${bin.brightness} lower_brightness"
    ];

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];
  };
}
