{ pkgs, config, colors, ... }: {
  wayland.windowManager.hyprland.settings =
  let
    cursor = config.home.pointerCursor;
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
    ];

    general = {
      gaps_in = 0;
      gaps_out = 0;
      "col.active_border" = "rgb(${colors.base03})";
      "col.inactive_border" = "rgb(${colors.base01})";
    };

    decoration = {
      shadow.enabled = false;
      blur.enabled = false;
    };

    input.numlock_by_default = true;
    dwindle.preserve_split = true;

    misc = {
      enable_swallow = true;
      swallow_regex = "(footclient|foot)";
    };

    animations = {
      bezier = [
        "easeOutQuint,0.22,1,0.36,1"
        "linear,0,0,1,1"
      ];

      animation = [
        "windows,1,4.5,easeOutQuint,popin 90%"
        "workspaces,1,4.5,easeOutQuint,slide"
        "fade,1,1.5,linear"
      ];
    };
    
    "$mod" = "SUPER";

    bind = [
      "$mod,Return,exec,uwsm app -T"
      "$mod,R,global,quickshell:launcherToggle"
      "$mod,B,exec,uwsm app -- firefox.desktop"
      "$mod,Space,exec,uwsm app -- keepassxc"
      ",XF86Calculator,exec,uwsm app -T -- bc -l"
      "$mod,Escape,exec,uwsm app -- hyprlock"

      "$mod SHIFT,C,killactive,"
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

      "$mod,I,global,quickshell:infoBoxToggle"
      "$mod,M,exec,${bin.music} open_youtube"
      "$mod SHIFT,M,exec,${bin.music} play_shuffle"

      ",Print,exec,${bin.screenshot} print_current_screen ${pictures}"
      "$mod,Print,exec,${bin.screenshot} print_selection ${pictures}"
    ] ++ workspaces;

    bindl = [
      ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioPlay,exec,playerctl play-pause"
      "$mod,period,exec,playerctl next"
      "$mod,comma,exec,playerctl previous"
      "$mod,S,exec,playerctl stop"
    ];

    bindle = [
      ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

      ",XF86MonBrightnessUp,exec,brightnessctl -e4 -n2 set 2%+"
      ",XF86MonBrightnessDown,exec,brightnessctl -e4 -n2 set 2%-"
    ];

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];

    windowrule = [
      "float,class:(firefox),title:(Picture-in-Picture)"
      "keepaspectratio,class:(firefox),title:(Picture-in-Picture)"
      "move 100%-w-10,class:(firefox),title:(Picture-in-Picture)"
      "size 25%,class:(firefox),title:(Picture-in-Picture)"
      "pin,class:(firefox),title:(Picture-in-Picture)"

      "float,title:(Save As)"
      "size 50%,title:(Save As)"
      "float,title:(Save Image)"
      "size 50%,title:(Save Image)"
      "float,title:(Open File)"
      "size 50%,title:(Open File)"
      "float,title:(Enter name of file to save to…)"
      "size 50%,title:(Enter name of file to save to…)"

      "noborder,onworkspace:w[t1],floating:0"
    ];
  };
}
