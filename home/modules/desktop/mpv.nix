{ pkgs, ... }: {
  programs.mpv = {
    scripts = with pkgs.mpvScripts; [ mpris notify-send ];

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
    };
  };
}
