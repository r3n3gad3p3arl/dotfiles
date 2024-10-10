{ pkgs, config, ... }: {
  wayland.windowManager.hyprland.settings =
  let
    cursor = config.home.pointerCursor;
    colors = config.scheme;
    inherit (pkgs.meowPkgs) bin;
    inherit (config.xdg.userDirs) pictures;
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
      "DP-1,preferred,auto,1" # secondary monitor
      ",preferred,auto,1" # fallback
    ];

    exec-once = [
      "hyprctl setcursor ${cursor.name} ${toString cursor.size}"
      "ags -b hypr"
    ];

    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 1;
      "col.active_border" = "rgb(${colors.base05})";
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
      "$mod,Return,exec,footclient"
      "$mod,R,exec,ags -b hypr -t applauncher"
      "$mod,B,exec,firefox"
      "$mod,Space,exec,keepassxc"
      ",XF86Calculator,exec,footclient bc -l"
      "$mod,Escape,exec,hyprlock"

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

      "$mod,I,exec,ags -b hypr -t infobox"
      "$mod,M,exec,${bin.music} open_youtube"
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

    windowrulev2 = [
      "float,class:(firefox),title:(Picture-in-Picture)"
      "pin,class:(firefox),title:(Picture-in-Picture)"
      "size 30%,class:(firefox),title:(Picture-in-Picture)"
      "move 100%-w-10,class:(firefox),title:(Picture-in-Picture)"
      "noborder,onworkspace:w[t1],floating:0"
    ];
  };
}
