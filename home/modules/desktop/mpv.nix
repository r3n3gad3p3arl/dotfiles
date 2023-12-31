{ pkgs, ... }: {
  programs.mpv = {
    scripts = with pkgs.mpvScripts; [ mpris pkgs.meowPkgs.mpvScripts.notify-send ];

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
    };
  };
}
